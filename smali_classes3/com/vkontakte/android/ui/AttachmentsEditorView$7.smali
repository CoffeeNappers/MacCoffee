.class Lcom/vkontakte/android/ui/AttachmentsEditorView$7;
.super Ljava/lang/Object;
.source "AttachmentsEditorView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/AttachmentsEditorView;->addAttachView(Landroid/view/View;Lcom/vkontakte/android/attachments/Attachment;I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

.field final synthetic val$index:I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/AttachmentsEditorView;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/AttachmentsEditorView;

    .prologue
    .line 552
    iput-object p1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$7;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    iput p2, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$7;->val$index:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 3

    .prologue
    .line 554
    iget-object v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$7;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    iget v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$7;->val$index:I

    add-int/lit8 v1, v1, 0x1

    const/high16 v2, 0x42a00000    # 80.0f

    invoke-static {v2}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v2

    mul-int/2addr v1, v2

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->smoothScrollTo(II)V

    .line 555
    return-void
.end method
