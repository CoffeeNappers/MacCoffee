.class Lcom/vkontakte/android/stickers/StickerPage$2;
.super Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;
.source "StickerPage.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/stickers/StickerPage;->getView(Landroid/content/Context;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/stickers/StickerPage;

.field final synthetic val$spanCount:I


# direct methods
.method constructor <init>(Lcom/vkontakte/android/stickers/StickerPage;I)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/stickers/StickerPage;

    .prologue
    .line 85
    iput-object p1, p0, Lcom/vkontakte/android/stickers/StickerPage$2;->this$0:Lcom/vkontakte/android/stickers/StickerPage;

    iput p2, p0, Lcom/vkontakte/android/stickers/StickerPage$2;->val$spanCount:I

    invoke-direct {p0}, Landroid/support/v7/widget/GridLayoutManager$SpanSizeLookup;-><init>()V

    return-void
.end method


# virtual methods
.method public getSpanSize(I)I
    .locals 1
    .param p1, "position"    # I

    .prologue
    .line 88
    iget-object v0, p0, Lcom/vkontakte/android/stickers/StickerPage$2;->this$0:Lcom/vkontakte/android/stickers/StickerPage;

    invoke-static {v0}, Lcom/vkontakte/android/stickers/StickerPage;->access$100(Lcom/vkontakte/android/stickers/StickerPage;)Z

    move-result v0

    if-eqz v0, :cond_0

    if-nez p1, :cond_0

    .line 89
    iget v0, p0, Lcom/vkontakte/android/stickers/StickerPage$2;->val$spanCount:I

    .line 91
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x1

    goto :goto_0
.end method
