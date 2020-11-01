function downloadFile(fileUrl)
{
    with (new JavaImporter(org.jsoup, java.io.BufferedInputStream))
    {

        var doc = Jsoup.connect(fileUrl)
            .method(Java.type('org.jsoup.Connection.Method').POST)
            .header('Accept', 'application/json')
            .header('Content-Type', 'application/json')
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

downloadAndSaveFile('http://www.pdf995.com/samples/pdf.pdf', 'mypdf.pdf', 'application/pdf')

var processDefinitionId = execution.getProcessDefinitionId();
var deploymentId = execution.getProcessEngineServices().getRepositoryService().getProcessDefinition(processDefinitionId).getDeploymentId();
var resource = execution.getProcessEngineServices().getRepositoryService().getResourceAsStream(deploymentId, 'potvrzeni-o-studiu.xsl');
var resourceTestXml = execution.getProcessEngineServices().getRepositoryService().getResourceAsStream(deploymentId, 'xmlTest.xml');

var IOUtils = Java.type('org.apache.commons.io.IOUtils');
var String = Java.type('java.lang.String');

var xsl = S(new String(IOUtils.toByteArray(resource), 'UTF-8'));
var xml = S(new String(IOUtils.toByteArray(resourceTestXml), 'UTF-8'));

var pdfRequestBody = xsl.concat("\n__XML_PROPERTIES__\n").concat(xml);
execution.setVariable('template', xml);