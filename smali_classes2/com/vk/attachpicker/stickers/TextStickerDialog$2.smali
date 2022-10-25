.class Lcom/vk/attachpicker/stickers/TextStickerDialog$2;
.super Ljava/lang/Object;
.source "TextStickerDialog.java"

# interfaces
.implements Lcom/vk/attachpicker/widget/ColorSelectorView$OnColorSelectedListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/attachpicker/stickers/TextStickerDialog;-><init>(ZZLandroid/content/Context;Ljava/lang/String;ILcom/vk/attachpicker/stickers/StickerStyle;Lcom/vk/attachpicker/stickers/TextStickerDialog$TextStickerDialogCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/attachpicker/stickers/TextStickerDialog;


# direct methods
.method constructor <init>(Lcom/vk/attachpicker/stickers/TextStickerDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/attachpicker/stickers/TextStickerDialog;

    .prologue
    .line 97
    iput-object p1, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog$2;->this$0:Lcom/vk/attachpicker/stickers/TextStickerDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBrushTypeSelected(I)V
    .locals 0
    .param p1, "brushType"    # I

    .prologue
    .line 106
    return-void
.end method

.method public onColorSelected(I)V
    .locals 1
    .param p1, "color"    # I

    .prologue
    .line 100
    iget-object v0, p0, Lcom/vk/attachpicker/stickers/TextStickerDialog$2;->this$0:Lcom/vk/attachpicker/stickers/TextStickerDialog;

    invoke-static {v0}, Lcom/vk/attachpicker/stickers/TextStickerDialog;->access$000(Lcom/vk/attachpicker/stickers/TextStickerDialog;)Lcom/vk/attachpicker/widget/BackPressEditText;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/vk/attachpicker/widget/BackPressEditText;->setTextColor(I)V

    .line 101
    return-void
.end method
