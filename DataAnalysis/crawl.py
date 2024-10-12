import os
import shutil
import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from time import sleep
import csv 
import pandas as pd

def remove_empty_lines(input_file, output_file):
    df = pd.read_csv(input_file)
    
    df = df.dropna(how='all')
    
    df.to_csv(output_file, index=False)

data_list = []
def writeAllDataToCSV(fileName, data_list):
    with open(fileName, 'a', newline='', encoding='utf-8') as csvfile:
        fieldnames = ['post_id', 'content', 'images']
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()
        for data in data_list:
            writer.writerow(data)

def checkLiveClone(driver):
    try:
        driver.get("https://mbasic.facebook.com/")
        time.sleep(1)
        elementLive = driver.find_elements(By.NAME, "view_post")
        if (len(elementLive) > 0):
            print("Live")
            return True
        return False
    except:
        print("view fb err")



def login(driver, username, password):
    driver.get("https://mbasic.facebook.com/login/?next&ref=dbl&fl&refid=8")
    sleep(1)
    userNameElement = driver.find_element(By.ID, "m_login_email")
    userNameElement.send_keys(username)
    passwordElement = driver.find_element(By.NAME, "pass")
    passwordElement.send_keys(password)
    btnSubmit = driver.find_element(By.NAME, "login")
    btnSubmit.click()
    sleep(1)
    notNowBtn = driver.find_element(By.XPATH,"/html/body/div/div/div/div/table/tbody/tr/td/div/div[3]/a")
    notNowBtn.click()
    time.sleep(1)
data_list = []
fileIds = 'post_ids.csv'
def readData(fileName, num_posts):
    data = []
    with open(fileName, 'r', encoding='utf-8') as f:
        for i, line in enumerate(f):
            if i >= num_posts:
                break
            try:
                line = line.strip()
                data.append(line)
            except:
                print("err")
    return data

def writeFileTxt(fileName, content):
    with open(fileName, 'a') as f1:
        f1.write(content + os.linesep)

def getPostsGroup(driver, idGroup, numberId):
    joinGroup(driver, idGroup)
    try:
        driver.get('https://mbasic.facebook.com/groups/' + str(idGroup))
        file_exists = os.path.exists(fileIds)
        if (not file_exists):
            writeFileTxt(fileIds, '\n')

        sumLinks = readData(fileIds,number_of_posts)
        while (len(sumLinks) < numberId):
            likeBtn = driver.find_elements(By.XPATH, '//*[contains(@id, "like_")]')
            if len(likeBtn):
                for id in likeBtn:
                    idPost = id.get_attribute('id').replace("like_", "")
                    if (idPost not in sumLinks):
                        sumLinks.append(idPost)
                        writeFileTxt(fileIds, idPost.strip())
                        print(idPost)
            nextBtn = driver.find_elements(By.XPATH, '//*[@id="m_group_stories_container"]/div/a')
            if (len(nextBtn)):
                sleep(6)
                nextBtn[0].click()
            else:
                print('Next btn does not exist !')
                break
    except:
        print('Error')
def clonePostContent(driver, postId = "1902017913316274"):
    try:
        driver.get("https://mbasic.facebook.com/" + str(postId))
        parrentImage = driver.find_elements(By.XPATH, "//div[@data-gt='{\"tn\":\"E\"}']")
        if (len(parrentImage) == 0):
            parrentImage = driver.find_elements(By.XPATH, "//div[@data-ft='{\"tn\":\"E\"}']")

        contentElement = driver.find_elements(By.XPATH, "//div[@data-gt='{\"tn\":\"*s\"}']")
        if (len(contentElement) == 0):
            contentElement = driver.find_elements(By.XPATH, "//div[@data-ft='{\"tn\":\"*s\"}']")

        if (len(contentElement)):
            content = contentElement[0].text

        linksArr = []
        if (len(parrentImage)):
            childsImage = parrentImage[0].find_elements(By.XPATH, ".//*")
            for childLink in childsImage:
                linkImage = childLink.get_attribute('href')
                if (linkImage != None):
                    linksArr.append(linkImage.replace("m.facebook", "mbasic.facebook"))
        linkImgsArr = []
        if (len(linksArr)):
            linkImgsArr = []
            for link in linksArr:
                driver.get(link)
                linkImg = driver.find_elements(By.XPATH, '//*[@id="MPhotoContent"]/div[1]/div[2]/span/div/span/a[1]')
                linkImgsArr.append(linkImg[0].get_attribute('href'))

        postData = {"post_id": postId, "content" : "", "images": []}

        if (len(linkImgsArr)):
            postData["images"] = linkImgsArr
        if (len(contentElement)):
            postData["content"] = content
        print(postData)
        return postData
    except:
        return False

def writeFileTxtPost(fileName, content, idPost, pathImg="/img/"):
    pathImage = os.getcwd() + pathImg + str(idPost)
    with open(os.path.join(pathImage, fileName), 'a') as f1:
        f1.write(content + os.linesep)

def download_file(url, localFileNameParam = "", idPost = "123456", pathName = "/data/"):
    try:
        if not os.path.exists(pathName.replace('/', '')):
            os.mkdir(pathName.replace('/', ''))

        local_filename = url.split('/')[-1]
        if local_filename:
            local_filename = localFileNameParam
        with requests.get(url, stream=True) as r:
            pathImage = os.getcwd() + pathName + str(idPost)

            if (os.path.exists(pathImage) == False):
                os.mkdir(pathImage)

            with open(os.path.join(pathImage, local_filename), 'wb') as f:
                shutil.copyfileobj(r.raw, f)
    except:
        print("download file err")
def writeAllDataToCSV(fileName, data_list):
    with open(fileName, 'a', newline='', encoding='utf-8') as csvfile:
        fieldnames = ['post_id', 'content', 'images']
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()
        for data in data_list:
            content = data['content'].replace('\n', '\\n')
            writer.writerow({'post_id': data['post_id'], 'content': content, 'images': data['images']})

def joinGroup(driver, idGoup):
    try:
        driver.get("https://mbasic.facebook.com/groups/" + idGoup)
        sleep(1)
        isJoined = driver.find_elements(By.XPATH, '//a[contains(@href, "cancelgroup")]')
        if (len(isJoined) == 0):
            sleep(1)
            # driver.find_elements(By.CSS_SELECTOR, "#root > div.bj > form > input.bu.bv.bw")[0].click()
            input_elements = driver.find_elements(By.CSS_SELECTOR, "#root > div.bj > form > input.bu.bv.bw")
            if input_elements:
                input_elements[0].click()

            sleep(1)
            textea = driver.find_elements(By.TAG_NAME, "textarea")

            if (len(textea) > 0):
                for el in textea:
                    sleep(1)
            sleep(1)
            btnSubmit = driver.find_elements(By.CSS_SELECTOR, "#group-membership-criteria-answer-form > div > div > input")

            if (len(btnSubmit)):
                btnSubmit[0].click()
                sleep(1)
        else:
            print("joined")
    except:
        print("error join!")
stop_crawl = False
def write_to_csv(file_name, data):
    fields = ['post_id', 'content', 'images']
    with open(file_name, mode='a', newline='', encoding='utf-8') as file:
        writer = csv.DictWriter(file, fieldnames=fields)
        writer.writeheader()  
        for item in data:
            writer.writerow(item)  

def stop_crawling():
    global stop_crawl
    stop_crawl = True
def crawl_post_data(driver, post_ids, data_list, content_type='page' ):
    folder_path = 'img'
    for post_id in post_ids:
        try:
            time.sleep(1)
            post_data = clonePostContent(driver, post_id)
            if post_data:
                data_image = []  
                if post_data.get("images") and len(post_data["images"]) > 0:
                    if content_type == 'group':
                        for image_url in post_data["images"]:
                            driver.get(image_url)
                            data_image.append(driver.current_url)
                    else:
                        data_image = post_data["images"]  

                post_id_str = str(post_data['post_id'])
                post_content = str(post_data['content'])
                download_count = 0

                for image_url in data_image:
                    download_count += 1
                    try:
                        download_file(image_url, str(download_count), post_id_str, folder_path)
                    except Exception as e:
                        print(f"Error downloading image: {e}")
                post_dict = {"post_id": post_id_str, "content": post_content, "images": data_image}
                data_list.append(post_dict)  
        except Exception as e:
            print(f"Error crawling post {post_id}: {e}")
    for post_data in data_list:
        print(post_data["post_id"])
    write_to_csv("output.csv", data_list)
    writeAllDataToCSV("output1.csv",data_list)
    return data_list
driver = webdriver.Edge()
isLogin = checkLiveClone(driver) 
print(isLogin)
userName = 'thienanh.quarter.tomorrow@gmail.com'
passWord = 'ilovequartertomorrow'

if (isLogin == False):
    login(driver, userName, passWord)

value = input('Enter 1 to crawl id post of group, enter 2 to crawl content: ')
number_of_posts = int(input('Enter the number of posts you want to crawl: '))

if (int(value) == 1):
    # getPostsGroup(driver, 'vieclamCNTTDaNang', number_of_posts)
    getPostsGroup(driver, 'it.tuyendung.24.7', number_of_posts)
    remove_empty_lines('post_ids.csv','post_ids.csv')
else:
    postIds = readData(fileIds,number_of_posts)
    crawl_post_data(driver, postIds,data_list ,'group')
    write_to_csv("output.csv", data_list)

print("END GAME") 
driver.quit()