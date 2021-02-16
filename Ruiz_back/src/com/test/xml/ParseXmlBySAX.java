package com.test.xml;

import org.xml.sax.Attributes;
import org.xml.sax.SAXException;
import org.xml.sax.helpers.DefaultHandler;

import javax.xml.parsers.SAXParser;
import javax.xml.parsers.SAXParserFactory;
import java.io.File;

public class ParseXmlBySAX extends DefaultHandler {

	@Override
	public void startDocument() throws SAXException {
		System.out.println("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
	}

	@Override
	public void startElement(String uri, String localName, String qName, Attributes a) throws SAXException {
		System.out.print("<");
		System.out.print(qName);
		if (a != null) {
			for (int i = 0; i < a.getLength(); i++) {
				System.out.print(" " + a.getQName(i) + "=\"" + a.getValue(i) + "\"");
			}
		}
		System.out.println(">");
	}

	@Override
	public void characters(char[] ch, int start, int length) throws SAXException {
		System.out.println(new String(ch, start, length));
	}

	@Override
	public void endElement(String uri, String localName, String qName) throws SAXException {
		System.out.print("</");
		System.out.print(qName);
		System.out.println(">");
	}

	@Override
	public void endDocument() throws SAXException {
		System.out.println("文档解析完成。");
	}

	public static void main(String[] args) throws Exception {

		SAXParserFactory spf = SAXParserFactory.newInstance();
		SAXParser sp = spf.newSAXParser();
		String path = "D:\\ws\\workspace2\\servlet\\xml\\test.xml";
		sp.parse(new File(path), new ParseXmlBySAX());
	}
}