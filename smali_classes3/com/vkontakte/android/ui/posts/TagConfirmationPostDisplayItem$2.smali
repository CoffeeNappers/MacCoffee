.class Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem$2;
.super Ljava/lang/Object;
.source "TagConfirmationPostDisplayItem.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;->onBindView(Landroid/view/View;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;

    .prologue
    .line 71
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem$2;->this$0:Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 74
    new-instance v0, Lcom/vkontakte/android/api/photos/PhotosRemoveTag;

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem$2;->this$0:Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;

    iget v1, v1, Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;->postOwnerID:I

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem$2;->this$0:Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;

    iget v2, v2, Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;->postID:I

    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem$2;->this$0:Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;

    invoke-static {v3}, Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;->access$100(Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem;)I

    move-result v3

    invoke-direct {v0, v1, v2, v3}, Lcom/vkontakte/android/api/photos/PhotosRemoveTag;-><init>(III)V

    new-instance v1, Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem$2$1;

    .line 75
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, p0, v2, p1}, Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem$2$1;-><init>(Lcom/vkontakte/android/ui/posts/TagConfirmationPostDisplayItem$2;Landroid/content/Context;Landroid/view/View;)V

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/photos/PhotosRemoveTag;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 82
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 83
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    .line 84
    return-void
.end method
