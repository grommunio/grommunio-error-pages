import json
with open("http-status-code.json") as json_file:
	data = json.load(json_file)
for i in data["values"]:
    template = "templates/" + i["value"][0:1] + "xx.html"
    with open(template) as f:
        content = f.read()
        new_content = content
        error_code = int(i["value"])

        print("Error Code: %d" % (error_code))

        if error_code == 418 or error_code < 400 or error_code > 599:
            continue
        new_content = new_content.replace("$ERROR_CODE", i["value"])
        new_content = new_content.replace("$ERROR_NAME", i["description"])
        new_content = new_content.replace("$ERROR_DESC", i["details"][0]["description"])
        with open(i["value"] + ".html", "w") as output_file:
            output_file.write(new_content)
