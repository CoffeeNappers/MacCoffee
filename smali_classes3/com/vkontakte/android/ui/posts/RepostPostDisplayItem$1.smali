.class Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;
.super Ljava/lang/Object;
.source "RepostPostDisplayItem.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;

    .prologue
    .line 30
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;->this$0:Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;
    .param p1, "x1"    # Landroid/content/Context;
    .param p2, "x2"    # Ljava/lang/String;
    .param p3, "x3"    # Ljava/lang/String;

    .prologue
    .line 30
    invoke-direct {p0, p1, p2, p3}, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;->startIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method private startIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "type"    # Ljava/lang/String;
    .param p3, "id"    # Ljava/lang/String;

    .prologue
    .line 66
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v1, "android.intent.action.VIEW"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v3, "vkontakte://vk.com/"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 67
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "no_browser"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 68
    invoke-virtual {p1, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 69
    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v4, 0x1

    .line 33
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;->this$0:Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;

    iget v0, v0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->repostType:I

    if-ne v0, v4, :cond_0

    .line 34
    new-instance v0, Lcom/vkontakte/android/api/VKAPIRequest;

    const-string/jumbo v1, "photos.getById"

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;-><init>(Ljava/lang/String;)V

    const-string/jumbo v1, "photos"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;->this$0:Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;

    iget v3, v3, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->uid:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;->this$0:Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;

    iget v3, v3, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->origID:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 35
    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;Ljava/lang/String;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "extended"

    .line 36
    invoke-virtual {v0, v1, v4}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    const-string/jumbo v1, "photo_sizes"

    .line 37
    invoke-virtual {v0, v1, v4}, Lcom/vkontakte/android/api/VKAPIRequest;->param(Ljava/lang/String;I)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    new-instance v1, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1$1;

    invoke-direct {v1, p0, p1}, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1$1;-><init>(Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;Landroid/view/View;)V

    .line 38
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 56
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/VKAPIRequest;->wrapProgress(Landroid/content/Context;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 57
    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec()Lcom/vkontakte/android/api/VKAPIRequest;

    .line 63
    :goto_0
    return-void

    .line 58
    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;->this$0:Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;

    iget v0, v0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->repostType:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 59
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string/jumbo v1, "id"

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;->this$0:Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;

    iget v2, v2, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->uid:I

    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;->startIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 61
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const-string/jumbo v1, "wall"

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;->this$0:Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;

    iget v3, v3, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->uid:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v3, "_"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    iget-object v3, p0, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;->this$0:Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;

    iget v3, v3, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem;->origID:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v0, v1, v2}, Lcom/vkontakte/android/ui/posts/RepostPostDisplayItem$1;->startIntent(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0
.end method
