function getSecret(key, secretsEnv) // if needed, this function can contain OAuth autentication.
{
    with (new JavaImporter(java.lang.System, java.nio.file))
    {
        var secretsPath = System.getenv(secretsEnv)
        var secretsFileBytes = Files.readAllBytes(Paths.get(secretsPath))
    }

    var String = Java.type('java.lang.String')
    var secretsFileString = new String(secretsFileBytes)

    var secretsJson = JSON.parse(secretsFileString)
    var secret = secretsJson[key]

    return secret.toString()
}

var token = getSecret('token', 'CAMUNDA_TOKENS_FILE') // get token
var url = getSecret('url', 'CAMUNDA_TOKENS_FILE') // get url

function downloadFile(fileUrl)
{
    with (new JavaImporter(org.jsoup, java.io.BufferedInputStream))
    {

        var processDefinitionId = execution.getProcessDefinitionId();
        var deploymentId = execution.getProcessEngineServices().getRepositoryService().getProcessDefinition(processDefinitionId).getDeploymentId();
        var resource = execution.getProcessEngineServices().getRepositoryService().getResourceAsStream(deploymentId, 'potvrzeni-o-studiu.xsl');
        var resourceTestXml = execution.getProcessEngineServices().getRepositoryService().getResourceAsStream(deploymentId, 'xmlTest.xml');

        var IOUtils = Java.type('org.apache.commons.io.IOUtils');
        var String = Java.type('java.lang.String');

        var xsl = S(new String(IOUtils.toByteArray(resource), 'UTF-8'));
        var xml = S(new String(IOUtils.toByteArray(resourceTestXml), 'UTF-8'));

        var pdfRequestBody = xsl;
        pdfRequestBody += "\n__XML_PROPERTIES__\n";
        pdfRequestBody += xml;

        var doc = Jsoup.connect(fileUrl)
            .method(Java.type('org.jsoup.Connection.Method').POST)
            .header('Accept', 'text/plain; charset=UTF-8')
            .header('Content-Type', 'text/plain; charset=UTF-8')
            .requestBody(pdfRequestBody)
            .timeout(30000)
            .ignoreContentType(true) // This is used because Jsoup "approved" content-types parsing is enabled by default by Jsoup
            .execute()

       // var doc = Jsoup.connect(fileUrl)
        //    .method(Java.type('org.jsoup.Connection.Method').GET)
        //    .timeout(30000)
        //    .ignoreContentType(true)
        //    .execute()

        var bodyStream = doc.bodyStream()

        return bodyStream
    }
}

function saveFile(fileStream, fileName, mimeType)
{
    var file = Java.type('org.camunda.bpm.engine.variable.Variables')
        .fileValue(fileName)
        .file(fileStream)
        .mimeType(mimeType)
        .create()

    execution.setVariable(fileName, file)

}

function generateXmlProperties() {
    var studentName = execution.getVariable("studentName");
    var programme = execution.getVariable("programme");
    var branch = execution.get
}

function downloadAndSaveFile(fileUrl, fileName, mimeType)
{
    var file = downloadFile(fileUrl)
    saveFile(file, fileName, mimeType)
}

downloadAndSaveFile(url, 'mypdf.pdf', 'application/pdf')


//execution.setVariable('template', xml);