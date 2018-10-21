package org.sunshine.utils;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.io.FilenameUtils;

public class ConvertImage {

	public static List<String> files = new ArrayList<String>();

	public static void listFilesForFolder(final File folder) {
		for (final File fileEntry : folder.listFiles()) {
			if (fileEntry.isDirectory()) {
				listFilesForFolder(fileEntry);
			} else {
				System.out.println(fileEntry.getName());
				files.add(fileEntry.getName());
			}
		}
	}

	public static void main(String[] args) {
		final File folder = new File(args[0]);
		final String inputFolder = args[0];
		final String outputFolder = args[1];
		listFilesForFolder(folder);
		for (String fileName : files) {
			String inputImage = inputFolder+"/"+fileName;
			String outPutFileWithOutExt = FilenameUtils
					.removeExtension(fileName);
			String oututImage = outputFolder+"/"+outPutFileWithOutExt + ".png";
			convert(inputImage, oututImage);
		}
	}

	public static void convert(String inputImage, String outputImage) {
		String formatName = "PNG";
		try {
			boolean result = ImageConverter.convertFormat(inputImage,
					outputImage, formatName);
			if (result) {
				System.out.println("Image converted successfully.");
			} else {
				System.out.println("Could not convert image.");
			}
		} catch (IOException ex) {
			System.out.println("Error during converting image.");
			ex.printStackTrace();
		}
	}

}
