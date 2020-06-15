$(document).ready(function () {
    $(".markdown-editor").each(function () {
        new SimpleMDE({
            element: $(this)[0],
            forceSync: true,
            indentWithTabs: false,
            insertTexts: {
                horizontalRule: ["", "\n\n-----\n\n"],
                image: ["![](http://", ")"],
                link: ["[", "](http://)"],
                table: ["", "\n\n| Column 1 | Column 2 | Column 3 |\n| -------- | -------- | -------- |\n| Text     | Text      | Text     |\n\n"],
            },
            status: false,
            toolbar: [
                "bold",
                "italic",
                "strikethrough",
                "|",
                "heading-1",
                "heading-2",
                "heading-3",
                "|",
                "quote",
                "unordered-list",
                "ordered-list",
                "|",
                "link",
                "image",
                "|",
                "table",
                "|",
                "horizontal-rule",
            ],
            toolbarTips: false,
        });
    });
})