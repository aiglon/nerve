function displayError(er)
{
    var page=document.getElementsByClassName("page")[0];
    page.innerHTML+=
    "<div class=\"modal fade\" id=\"errorModal\" role=\"dialog\">\n" +
    "  <div class=\"modal-dialog\">\n" +
    "    <div class=\"modal-content\">\n" +
    "      <div class=\"modal-header\">\n" +
    "        <button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>\n" +
    "        <h4 class=\"modal-title\">Erreur</h4>\n" +
    "      </div>\n" +
    "      <div class=\"modal-body\">\n" +
    "        "+er+"\n" +
    "      </div>\n" +
    "      <div class=\"modal-footer\">\n" +
    "        <button type=\"button\" id=\"yesForcBtn\" style=\"width: 125px;\" class=\"btn btn-danger\">Oui</button>\n" +
    "        <button type=\"button\" class=\"btn btn-success\" style=\"width: 125px;\" data-dismiss=\"modal\">Non</button>\n" +
    "      </div>\n" +
    "    </div>\n" +
    "  </div>\n" +
    "</div>\n";
}
function displayErrorOk(er)
{
    var page=document.getElementsByClassName("page")[0];
    page.innerHTML+=
    "<div class=\"modal fade\" id=\"errorModal\" role=\"dialog\">\n" +
    "  <div class=\"modal-dialog\">\n" +
    "    <div class=\"modal-content\">\n" +
    "      <div class=\"modal-header\">\n" +
    "        <button type=\"button\" class=\"close\" data-dismiss=\"modal\">&times;</button>\n" +
    "        <h4 class=\"modal-title\">Erreur</h4>\n" +
    "      </div>\n" +
    "      <div class=\"modal-body\">\n" +
    "        "+er+"\n" +
    "      </div>\n" +
    "      <div class=\"modal-footer\">\n" +
    "        <button type=\"button\" id=\"ok\" class=\"btn btn-default\" style=\"width: 125px;\" data-dismiss=\"modal\">OK</button>\n" +
    "      </div>\n" +
    "    </div>\n" +
    "  </div>\n" +
    "</div>\n";
}


