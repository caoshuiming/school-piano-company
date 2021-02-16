package com.test.xml;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import javax.xml.parsers.ParserConfigurationException;
import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import java.io.File;

/**
 * 通过SAX解析XML.
 */
public class SAXDemo extends DefaultHandler {

    @Override
    public void startDocument() throws SAXException {
        System.out.println("SAX开始解析XML");
    }


    /**
     * 元素开始解析。
     *
     * @param uri
     * @param localName
     * @param qName      元素名称。
     * @param attributes 元素的属性。
     * @throws SAXException
     */
    @Override
    public void startElement(String uri, String localName, String qName, Attributes attributes) throws SAXException {
        System.out.println("开始解析" + qName + "元素");
        // 打印这个元素的属性
        for (int i = 0; i < attributes.getLength(); i++) {
            String name = attributes.getQName(i);
            String value = attributes.getValue(i);
            System.out.println("属性：" + name + " = " + value);
        }
    }

    /**
     * 获取元素的内容。
     * @param ch
     * @param start
     * @param length
     * @throws SAXException
     */
    @Override
    public void characters(char[] ch, int start, int length) throws SAXException {
        String value = new String(ch, start, length);
        System.out.println("值：" + value);
    }

    /**
     * 元素解析完毕
     *
     * @param uri
     * @param localName
     * @param qName     元素的名字。
     * @throws SAXException
     */
    @Override
    public void endElement(String uri, String localName, String qName) throws SAXException {
        System.out.println(qName + "解析完毕！");
    }

    @Override
    public void endDocument() throws SAXException {
        System.out.println("SAX解析完毕！");
    }

    public static void main(String[] args) throws Exception {

        String path = "D:\\ws\\workspace2\\servlet\\xml\\test.xml";
        // path = "D:\\ws\\workspace2\\servlet\\xml\\books1.xml";
        // 构建SAX解析工厂
        SAXParserFactory spf = SAXParserFactory.newInstance();
        // 构建SAX解析器
        SAXParser parser = spf.newSAXParser();
        // 解析
        parser.parse(new File(path), new SAXDemo());
    }
}
