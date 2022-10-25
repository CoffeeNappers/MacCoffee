.class Lcom/vkontakte/android/ui/AttachmentsEditorView$5;
.super Ljava/lang/Object;
.source "AttachmentsEditorView.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/AttachmentsEditorView;->add(Lcom/vkontakte/android/attachments/Attachment;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

.field final synthetic val$la:Lcom/vkontakte/android/attachments/PollAttachment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/AttachmentsEditorView;Lcom/vkontakte/android/attachments/PollAttachment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/AttachmentsEditorView;

    .prologue
    .line 428
    iput-object p1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$5;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    iput-object p2, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$5;->val$la:Lcom/vkontakte/android/attachments/PollAttachment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 434
    iget-object v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$5;->val$la:Lcom/vkontakte/android/attachments/PollAttachment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/news/PollEditorFragment;->edit(Lcom/vkontakte/android/attachments/PollAttachment;)Lcom/vkontakte/android/fragments/news/PollEditorFragment$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$5;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v1

    const/16 v2, 0x9

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/fragments/news/PollEditorFragment$Builder;->forResult(Landroid/app/Activity;I)Z

    .line 435
    return-void
.end method
