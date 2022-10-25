.class Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$1;
.super Ljava/lang/Object;
.source "DocumentAttachment.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->bind(Lcom/vkontakte/android/attachments/DocumentAttachment;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

.field final synthetic val$item:Lcom/vkontakte/android/attachments/DocumentAttachment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;Lcom/vkontakte/android/attachments/DocumentAttachment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    .prologue
    .line 529
    iput-object p1, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$1;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    iput-object p2, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$1;->val$item:Lcom/vkontakte/android/attachments/DocumentAttachment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 4

    .prologue
    .line 532
    iget-object v2, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$1;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    iget-object v2, v2, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mImageView:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v2}, Lcom/vk/imageloader/view/VKImageView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v2

    invoke-virtual {v2, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 533
    iget-object v2, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$1;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    iget-object v2, v2, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mImageView:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v2}, Lcom/vk/imageloader/view/VKImageView;->getHeight()I

    move-result v2

    iget-object v3, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$1;->val$item:Lcom/vkontakte/android/attachments/DocumentAttachment;

    iget v3, v3, Lcom/vkontakte/android/attachments/DocumentAttachment;->width:I

    mul-int/2addr v2, v3

    iget-object v3, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$1;->val$item:Lcom/vkontakte/android/attachments/DocumentAttachment;

    iget v3, v3, Lcom/vkontakte/android/attachments/DocumentAttachment;->height:I

    div-int v0, v2, v3

    .line 534
    .local v0, "displayedWidth":I
    iget-object v2, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$1;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    iget-object v2, v2, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mImageView:Lcom/vk/imageloader/view/VKImageView;

    invoke-virtual {v2}, Lcom/vk/imageloader/view/VKImageView;->getWidth()I

    move-result v2

    sub-int/2addr v2, v0

    div-int/lit8 v1, v2, 0x2

    .line 535
    .local v1, "offset":I
    iget-object v2, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$1;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    iget-object v2, v2, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mSize:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup$MarginLayoutParams;

    iget v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr v3, v1

    iput v3, v2, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    .line 536
    iget-object v2, p0, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder$1;->this$0:Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;

    iget-object v2, v2, Lcom/vkontakte/android/attachments/DocumentAttachment$GifHolder;->mSize:Landroid/widget/TextView;

    invoke-virtual {v2}, Landroid/widget/TextView;->requestLayout()V

    .line 537
    const/4 v2, 0x1

    return v2
.end method
