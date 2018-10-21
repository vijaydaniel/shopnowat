package org.sunshine.menu;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NamedNodeMap;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

public class MenuController {

	private Document doc = null;

	public void buildDocument(String filePath) {
		try {
			DocumentBuilderFactory docFactory = DocumentBuilderFactory
					.newInstance();
			DocumentBuilder docBuilder = docFactory.newDocumentBuilder();
			doc = docBuilder.parse(filePath);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void findVersionsToConsolidate() {
		NodeList databaseChangesets = doc.getElementsByTagName("changeSet");
		for (int temp = 0; temp < databaseChangesets.getLength(); temp++) {
			Node node = databaseChangesets.item(temp);
			if (node.getNodeType() == Node.ELEMENT_NODE) {
				Element changeset = (Element) node;
				String id = changeset.getAttribute("id");
				String[] id_parts = id.split("\\.");
				String version = id_parts[0] + "." + id_parts[1];

				}
		}
	}

	public static void main(String args[]) {

		MenuController compressChangelog = new MenuController();

		try {
			String filePath = "/edos/soa/trunk/data-access-layer/dal-db-schema/src/edosdp-scripts/upgrade/dal_itk_database_change_log.xml";
			compressChangelog.buildDocument(filePath);
			compressChangelog.findVersionsToConsolidate();
			compressChangelog.getSqlFilesToConsolidate();

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	private void getSqlFilesToConsolidate() {
		// Get the root element
		NodeList databaseChangesets = doc.getElementsByTagName("changeSet");

		Map sqlMap = new HashMap<String, String>();

		for (int temp = 0; temp < databaseChangesets.getLength(); temp++) {
			Node node = databaseChangesets.item(temp);
			if (node.getNodeType() == Node.ELEMENT_NODE) {

				Element changeset = (Element) node;

				NodeList list = node.getChildNodes();
				for (int i = 0; i < list.getLength(); i++) {
					Node changesetContents = list.item(i);
					// Element sqlFileElement = (Element) changesetContents;
					if ("sqlFile".equals(changesetContents.getNodeName())) {
						NamedNodeMap attributesList = changesetContents
								.getAttributes();
						for (int j = 0; j < attributesList.getLength(); j++) {
							/*System.out.println("Attribute: "
									+ attributesList.item(j).getNodeName()
									+ " = "
									+ attributesList.item(j).getNodeValue());*/

						}
					}
				}
			}

		}
	}
}