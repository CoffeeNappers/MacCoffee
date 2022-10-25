.class Lcom/vk/stories/dialog/StorySendMessageDialog$1;
.super Ljava/lang/Object;
.source "StorySendMessageDialog.java"

# interfaces
.implements Landroid/text/TextWatcher;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vk/stories/dialog/StorySendMessageDialog;-><init>(Landroid/content/Context;ILcom/vk/stories/model/StoryEntry;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vk/stories/dialog/StorySendMessageDialog;


# direct methods
.method constructor <init>(Lcom/vk/stories/dialog/StorySendMessageDialog;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/stories/dialog/StorySendMessageDialog;

    .prologue
    .line 63
    iput-object p1, p0, Lcom/vk/stories/dialog/StorySendMessageDialog$1;->this$0:Lcom/vk/stories/dialog/StorySendMessageDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public afterTextChanged(Landroid/text/Editable;)V
    .locals 2
    .param p1, "editable"    # Landroid/text/Editable;

    .prologue
    .line 76
    iget-object v0, p0, Lcom/vk/stories/dialog/StorySendMessageDialog$1;->this$0:Lcom/vk/stories/dialog/StorySendMessageDialog;

    invoke-static {v0}, Lcom/vk/stories/dialog/StorySendMessageDialog;->access$000(Lcom/vk/stories/dialog/StorySendMessageDialog;)Landroid/widget/ImageView;

    move-result-object v1

    invoke-interface {p1}, Landroid/text/Editable;->length()I

    move-result v0

    if-lez v0, :cond_0

    const/high16 v0, 0x3f800000    # 1.0f

    :goto_0
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 77
    iget-object v0, p0, Lcom/vk/stories/dialog/StorySendMessageDialog$1;->this$0:Lcom/vk/stories/dialog/StorySendMessageDialog;

    invoke-static {v0}, Lcom/vk/stories/dialog/StorySendMessageDialog;->access$000(Lcom/vk/stories/dialog/StorySendMessageDialog;)Landroid/widget/ImageView;

    move-result-object v1

    invoke-interface {p1}, Landroid/text/Editable;->length()I

    move-result v0

    if-lez v0, :cond_1

    const/4 v0, 0x1

    :goto_1
    invoke-virtual {v1, v0}, Landroid/widget/ImageView;->setEnabled(Z)V

    .line 78
    return-void

    .line 76
    :cond_0
    const v0, 0x3ecccccd    # 0.4f

    goto :goto_0

    .line 77
    :cond_1
    const/4 v0, 0x0

    goto :goto_1
.end method

.method public beforeTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "charSequence"    # Ljava/lang/CharSequence;
    .param p2, "i"    # I
    .param p3, "i1"    # I
    .param p4, "i2"    # I

    .prologue
    .line 67
    return-void
.end method

.method public onTextChanged(Ljava/lang/CharSequence;III)V
    .locals 0
    .param p1, "charSequence"    # Ljava/lang/CharSequence;
    .param p2, "i"    # I
    .param p3, "i1"    # I
    .param p4, "i2"    # I

    .prologue
    .line 72
    return-void
.end method
