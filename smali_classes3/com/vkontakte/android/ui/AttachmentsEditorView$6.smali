.class Lcom/vkontakte/android/ui/AttachmentsEditorView$6;
.super Ljava/lang/Object;
.source "AttachmentsEditorView.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


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

.field final synthetic val$view:Landroid/view/View;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/AttachmentsEditorView;Landroid/view/View;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/AttachmentsEditorView;

    .prologue
    .line 535
    iput-object p1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$6;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    iput-object p2, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$6;->val$view:Landroid/view/View;

    iput p3, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$6;->val$index:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 5

    .prologue
    .line 538
    iget-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$6;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 539
    new-instance v0, Landroid/widget/LinearLayout$LayoutParams;

    const/high16 v1, 0x42c00000    # 96.0f

    invoke-static {v1}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v1

    const/high16 v2, 0x42900000    # 72.0f

    invoke-static {v2}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v2

    invoke-direct {v0, v1, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 540
    .local v0, "lp":Landroid/widget/LinearLayout$LayoutParams;
    const/high16 v1, 0x41000000    # 8.0f

    invoke-static {v1}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v1

    iput v1, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 541
    iget-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$6;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->access$100(Lcom/vkontakte/android/ui/AttachmentsEditorView;)Landroid/widget/LinearLayout;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$6;->val$view:Landroid/view/View;

    iget v3, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$6;->val$index:I

    iget-object v4, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$6;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-static {v4}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->access$100(Lcom/vkontakte/android/ui/AttachmentsEditorView;)Landroid/widget/LinearLayout;

    move-result-object v4

    invoke-virtual {v4}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-virtual {v1, v2, v3, v0}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;ILandroid/view/ViewGroup$LayoutParams;)V

    .line 542
    const/4 v1, 0x1

    return v1
.end method
