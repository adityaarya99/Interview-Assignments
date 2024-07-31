# PDF Reader Application

## Objective
This Flutter application allows users to upload a PDF file, reads, and extracts specific details from the PDF, and displays the extracted details on the UI.

## Details to Extract
1. **Account Number**
2. **Statement Period**
3. **Closing Balance**
4. **Date**
5. **Transactions** (including Debit, Credit, and Balance for each transaction)
6. **Balance**

## Requirements
1. **File Upload**: Implement functionality for the user to upload a PDF file.
2. **PDF Parsing**: Extract the required details from the uploaded PDF.
3. **State Management**: Use the Bloc pattern for state management.
4. **UI**: Display the extracted details in a user-friendly manner.

## PDF Link
[Sample PDF for Extraction](https://drive.google.com/file/d/1TjH9B0ajvbSNDSmCCoGtRnB1uee1aipc/view?usp=drive_link)

### Project Walkthrough
- **File Upload**: Implemented in `pdf_upload_widget.dart` using the `file_picker` package.
- **PDF Parsing**: Parsing logic is in `pdf_parser.dart` using the `pdf` package to extract details.
- **State Management**: Managed using Bloc pattern. Bloc files are located in the `blocs` directory.
- **UI**: Designed with user-friendliness in mind, screens are in the `screens` directory.

### Usage
1. Open the application.
2. Use the file upload functionality to select and upload a PDF file.
3. The application will parse **the PDF and extract** details such as Account Number, Statement Period, Closing Balance, Date, Transactions, and Balance.
4. Extracted details will be displayed on the UI.

### UI Components
- **Home Screen**: Provides the interface for uploading a PDF.
- **PDF Display Screen**: Displays the extracted details from the uploaded PDF.

### Contributing
Feel free to open issues or submit pull requests for improvements or fixes.

### License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details. .
