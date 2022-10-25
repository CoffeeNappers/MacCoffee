.class Lcom/vk/stories/dialog/StorySendMessageDialog$3;
.super Ljava/lang/Object;
.source "StorySendMessageDialog.java"

# interfaces
.implements Lcom/vk/attachpicker/widget/BackPressEditText$OnBackPressedCallback;


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
    .line 97
    iput-object p1, p0, Lcom/vk/stories/dialog/StorySendMessageDialog$3;->this$0:Lcom/vk/stories/dialog/StorySendMessageDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onBackPressed()V
    .locals 1

    .prologue
    .line 100
    iget-object v0, p0, Lcom/vk/stories/dialog/StorySendMessageDialog$3;->this$0:Lcom/vk/stories/dialog/StorySendMessageDialog;

    invoke-virtual {v0}, Lcom/vk/stories/dialog/StorySendMessageDialog;->dismiss()V

    .line 101
    return-void
.end method
