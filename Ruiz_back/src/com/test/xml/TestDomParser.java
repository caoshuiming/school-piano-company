package com.test.xml;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import java.io.File;

/**
 * dom解析xml.
 */
public class TestDomParser {

    public static void main(String[] args) throws Exception {

        String path = "D:\\ws\\workspace2\\servlet\\xml\\test.xml";
        // 构建解析的工厂类
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        // 构建DOM解析工厂
        DocumentBuilder db = dbf.newDocumentBuilder();
        // 可以解析xml，获取Document对象
        Document document = db.parse(new File(path));
        // 获得根节点
        Element root = document.getDocumentElement();
        String rootName = root.getTagName();
        System.out.println("根节点名称：" + rootName);
        // 根据元素的名称获取元素“child”
        NodeList childList = root.getElementsByTagName("child");
        // 循环迭代
        for (int i = 0; i < childList.getLength(); i++) {
            Element child = (Element) childList.item(i);
            // 获取ID属性
            String id = child.getAttribute("id");
            System.out.println(" id= " + id);
            // 获取<child>里面的<value1>节点
            NodeList value1List = child.getElementsByTagName("value1");
            for(int j = 0; j<value1List.getLength(); j++) {
                // 获取<value1>节点
                Element value1 = (Element) value1List.item(j);
                // 获取<value1>节点的文本内容。
                // xml文本节点其实也是一个节点，所以这里我们拿到了<value1>节点以后然后通过getFirstChild()，才能获取它里面的值。
                String value = value1.getFirstChild().getNodeValue();
                System.out.println("value1=" +value);
            }
            // 获取<child>里面的<value2>节点
            NodeList value2List = child.getElementsByTagName("value2");
            for(int j = 0; j<value2List.getLength(); j++) {
                Element value2 = (Element) value2List.item(j);
                String value = value2.getFirstChild().getNodeValue();
                System.out.println("value2=" +value);
            }
        }
    }
}