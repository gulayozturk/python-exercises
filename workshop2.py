#kodlama.io sitesinde
#kurs sayısını kontrol eden (6)
#"Senior" kelimesi ile arama yapıldığında çıkan sonuçta 1 kurs 
#ve bu kursun isminin Senior Yazılım Geliştirici Yetiştirme Kampı (.NET) olduğunu kontrol eden- test caseleri geliştiriniz.
#Her test case için son çıktının ekran görüntüsü {tarih}-01 kalıbında kaydedilmelidir. 

from selenium import webdriver
from datetime import date
from selenium.webdriver.common.by import By
from time import sleep
from selenium.webdriver.common.keys import Keys

#soru1
driver = webdriver.Chrome()
driver.get("https://www.kodlama.io/")
driver.maximize_window()

kurs = driver.find_elements(By.XPATH,"//*[@class='course-box-image-container']") 

kursSayisi = len(kurs)
print(kursSayisi)

if kursSayisi == 6:
    print("Testi Başarılı!", " Toplam Kurs Sayısı:" + str(kursSayisi))
else:
    print("Test Başarısız!")

driver.execute_script("document.body.style.zoom='50%'")
driver.save_screenshot(str(date.today()) + '(1).png')
sleep(3)
driver.close()

#soru2
driver = webdriver.Chrome()
driver.get("https://www.kodlama.io/")
driver.maximize_window()


search = driver.find_element(By.XPATH,'//*[@id="search-courses"]')
search.send_keys("senior")
sleep(3)
searchBtn = driver.find_element(By.XPATH,'//*[@id="search-course-button"]/i')
searchBtn.click()
sleep(5)

title = driver.find_element(By.XPATH,"/html/body/div[1]/div/div/div[2]/div/div/div[1]/a/div/div[2]")
titleText = title.text
 

if titleText == "Senior Yazılım Geliştirici Yetiştirme Kampı (.NET)":

    print("Kurs adı doğrudur: Senior Yazılım Geliştirici Yetiştirme Kampı (.NET)")

else:

    print("Kurs adı yanlıştır")

driver.save_screenshot(str(date.today()) + '(2).png')






