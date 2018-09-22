import requests

target_url = "https://courses.christuniversity.in/login/index.php"
data_dict = {"username":"1641034" , "password": "81413582" , "loginbtn": "submit"}
response = requests.post(target_url, data=data_dict)
print(response.content)
