.class Lcom/vkontakte/android/ui/AttachmentsEditorView$ScrollRunner;
.super Ljava/lang/Object;
.source "AttachmentsEditorView.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/AttachmentsEditorView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ScrollRunner"
.end annotation


# instance fields
.field k:I

.field final synthetic this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/ui/AttachmentsEditorView;I)V
    .locals 1
    .param p2, "_k"    # I

    .prologue
    .line 809
    iput-object p1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$ScrollRunner;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 807
    const/4 v0, 0x1

    iput v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$ScrollRunner;->k:I

    .line 810
    iput p2, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$ScrollRunner;->k:I

    .line 811
    return-void
.end method


# virtual methods
.method public run()V
    .locals 4

    .prologue
    .line 814
    iget-object v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$ScrollRunner;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->access$300(Lcom/vkontakte/android/ui/AttachmentsEditorView;)Landroid/view/View;

    move-result-object v0

    if-nez v0, :cond_1

    .line 827
    :cond_0
    :goto_0
    return-void

    .line 817
    :cond_1
    iget-object v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$ScrollRunner;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getScrollX()I

    move-result v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$ScrollRunner;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->access$100(Lcom/vkontakte/android/ui/AttachmentsEditorView;)Landroid/widget/LinearLayout;

    move-result-object v1

    invoke-virtual {v1}, Landroid/widget/LinearLayout;->getWidth()I

    move-result v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$ScrollRunner;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v2}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getWidth()I

    move-result v2

    sub-int/2addr v1, v2

    if-ne v0, v1, :cond_2

    iget v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$ScrollRunner;->k:I

    if-gtz v0, :cond_0

    .line 820
    :cond_2
    iget-object v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$ScrollRunner;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-virtual {v0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->getScrollX()I

    move-result v0

    if-nez v0, :cond_3

    iget v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$ScrollRunner;->k:I

    if-ltz v0, :cond_0

    .line 823
    :cond_3
    iget-object v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$ScrollRunner;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    iget v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$ScrollRunner;->k:I

    mul-int/lit8 v1, v1, 0x2

    int-to-float v1, v1

    invoke-static {v1}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->scrollBy(II)V

    .line 824
    iget-object v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$ScrollRunner;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    iget-object v1, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$ScrollRunner;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->access$500(Lcom/vkontakte/android/ui/AttachmentsEditorView;)F

    move-result v1

    iget v2, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$ScrollRunner;->k:I

    mul-int/lit8 v2, v2, 0x2

    int-to-float v2, v2

    invoke-static {v2}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v1, v2

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->access$502(Lcom/vkontakte/android/ui/AttachmentsEditorView;F)F

    .line 825
    iget-object v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$ScrollRunner;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    invoke-static {v0}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->access$900(Lcom/vkontakte/android/ui/AttachmentsEditorView;)V

    .line 826
    iget-object v0, p0, Lcom/vkontakte/android/ui/AttachmentsEditorView$ScrollRunner;->this$0:Lcom/vkontakte/android/ui/AttachmentsEditorView;

    const-wide/16 v2, 0xa

    invoke-virtual {v0, p0, v2, v3}, Lcom/vkontakte/android/ui/AttachmentsEditorView;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_0
.end method
