import pytest
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from selenium.webdriver.chrome.options import Options
import time

@pytest.fixture(scope="module")
def browser():
    chrome_options = Options()
    chrome_options.add_argument("--headless")
    chrome_options.add_argument("--no-sandbox")
    chrome_options.add_argument("--disable-dev-shm-usage")
    service = Service('/usr/bin/chromedriver')
    driver = webdriver.Chrome(service=service, options=chrome_options)
    yield driver
    driver.quit()

def test_homepage(browser):
    browser.get("http://flask-service")
    time.sleep(2)
    assert "Hello" in browser.page_source

def test_status_page(browser):
    browser.get("http://flask-service/status")
    time.sleep(2)
    assert "Running" in browser.page_source
