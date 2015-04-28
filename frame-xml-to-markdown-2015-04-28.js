// slidetranscripts

var slidetranscripts = [];
var sts = document.getElementsByTagName('slidetranscript');

for  (var i=0; i < sts.length ; i++) {
    
    slideid = sts[i].getAttribute("slideid");
    textcontent = sts[i].textContent.slice(147).split("</font>")[0];
    
    slidetranscripts[slideid] = textcontent;
}

// slidelinks

sls = $x("//slidelink");

md = "";

for  (var i=0; i < sls.length ; i++) {
    
    slideid = sls[i].getAttribute("slideid") || "";
    displaytext = sls[i].getAttribute("displaytext");
    
    // "_player.5YooFIJPS1h.6Y3xojnc4LO" for example
    ml = (slideid.match("_player\\..*\\..*") || "").length;
    content = "";

    switch (ml) {
        
        case (1):
            headerLevel = 3;
    
            // <slidetranscript> inner HTML
            slideidWOPlayer = slideid.split("_player.")[1];
            content = slidetranscripts[slideidWOPlayer];
            break;
        
        case(0):
            parent1 = sls[i].parentElement;
            parent2 = parent1.parentElement;
            parent2NodeName = parent2.nodeName;
            
            if (parent2NodeName === "outline") {
                headerLevel = 1;
            } else {
                headerLevel = 2;
            }
            break;
    }
    
    // DEBUG
    //console.log("\n\n\n");
    //console.log(i);
    //console.log(ml);
    //console.log(parent1.nodeName);
    //console.log(parent2.nodeName);
    //console.log("headerLevel = " + headerLevel);
    
    //# Markdown header
    //console.log("#".repeat(headerLevel) + " " + displaytext + "\n");
    //console.log(content);
    //console.log("\n");
    
    md = md + "#".repeat(headerLevel) + " " + displaytext + "\n";
    md = md + content;
    md = md + "\n\n";

}
