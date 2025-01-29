import os
import tkinter as tk
from tkinter import filedialog
import webbrowser


def format_size(size_in_bytes):
    """Format the size in bytes to GB or MB depending on the value."""
    size_in_gb = size_in_bytes / (1024 ** 3)  # Convert to GB
    if size_in_gb >= 1:
        return f"{size_in_gb:.2f} GB"
    else:
        size_in_mb = size_in_bytes / (1024 ** 2)  # Convert to MB
        return f"{size_in_mb:.2f} MB"


def get_folder_info(path):
    """Get the size and number of files in a folder."""
    total_size = 0
    file_count = 0

    for dirpath, dirnames, filenames in os.walk(path):
        for file in filenames:
            file_path = os.path.join(dirpath, file)
            if not os.path.islink(file_path):  # Skip symbolic links
                total_size += os.path.getsize(file_path)
                file_count += 1
    return total_size, file_count


def generate_html(base_path):
    """Generate an HTML file with the folder and file details."""
    html_content = f"""
    <html>
    <head>
        <title>Folder Details - {base_path}</title>
        <style>
            body {{ font-family: Arial, sans-serif; margin: 20px; }}
            table {{ border-collapse: collapse; width: 100%; }}
            th, td {{ border: 1px solid #ddd; padding: 8px; text-align: left; }}
            th {{ background-color: #f4f4f4; }}
            h2 {{ color: #333; }}
        </style>
    </head>
    <body>
        <h2>Details of Selected Folder: {base_path}</h2>
    """

    # List files in the root folder
    html_content += """
    <h3>Files in Root Folder</h3>
    <table>
        <tr>
            <th>File Name</th>
            <th>Size</th>
        </tr>
    """
    for item in os.listdir(base_path):
        item_path = os.path.join(base_path, item)
        if os.path.isfile(item_path):
            file_size = os.path.getsize(item_path)
            html_content += f"""
            <tr>
                <td>{item}</td>
                <td>{format_size(file_size)}</td>
            </tr>
            """
    html_content += "</table>"

    # List subfolders with details
    html_content += """
    <h3>Subfolders</h3>
    <table>
        <tr>
            <th>Folder Name</th>
            <th>Size</th>
            <th>File Count</th>
        </tr>
    """
    for item in os.listdir(base_path):
        item_path = os.path.join(base_path, item)
        if os.path.isdir(item_path):
            folder_size, file_count = get_folder_info(item_path)
            html_content += f"""
            <tr>
                <td>{item}</td>
                <td>{format_size(folder_size)}</td>
                <td>{file_count}</td>
            </tr>
            """
    html_content += "</table>"

    # End HTML content
    html_content += """
    </body>
    </html>
    """
    return html_content


if __name__ == "__main__":
    # Initialize the Tkinter root and hide the main window
    root = tk.Tk()
    root.withdraw()

    # Open a folder picker dialog
    base_directory = filedialog.askdirectory(title="Select a Directory")

    if base_directory:
        print(f"Selected Directory: {base_directory}")

        # Generate HTML content
        html_output = generate_html(base_directory)

        # Save to an HTML file
        output_file = os.path.join(base_directory, "folder_details.html")
        with open(output_file, "w", encoding="utf-8") as file:
            file.write(html_output)

        print(f"Details saved to {output_file}")

        # Open in the default web browser
        webbrowser.open(f"file://{output_file}")
    else:
        print("No directory was selected.")
