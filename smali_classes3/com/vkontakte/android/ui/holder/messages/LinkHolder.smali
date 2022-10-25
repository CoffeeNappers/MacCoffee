.class public Lcom/vkontakte/android/ui/holder/messages/LinkHolder;
.super Lcom/vkontakte/android/ui/holder/RecyclerHolder;
.source "LinkHolder.java"

# interfaces
.implements Lme/grishka/appkit/views/UsableRecyclerView$Clickable;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/ui/holder/RecyclerHolder",
        "<",
        "Lcom/vkontakte/android/Link;",
        ">;",
        "Lme/grishka/appkit/views/UsableRecyclerView$Clickable;"
    }
.end annotation


# instance fields
.field private imageView:Lcom/vk/imageloader/view/VKImageView;

.field private final link:Landroid/widget/TextView;

.field private final thumb:Landroid/widget/TextView;

.field private final title:Landroid/widget/TextView;


# direct methods
.method public constructor <init>(Landroid/view/ViewGroup;)V
    .locals 1
    .param p1, "parent"    # Landroid/view/ViewGroup;

    .prologue
    .line 25
    const v0, 0x7f0300f0

    invoke-direct {p0, v0, p1}, Lcom/vkontakte/android/ui/holder/RecyclerHolder;-><init>(ILandroid/view/ViewGroup;)V

    .line 26
    const v0, 0x7f100124

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/messages/LinkHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/vk/imageloader/view/VKImageView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/LinkHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    .line 27
    const v0, 0x7f100128

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/messages/LinkHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/LinkHolder;->title:Landroid/widget/TextView;

    .line 28
    const v0, 0x7f10037b

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/messages/LinkHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/LinkHolder;->link:Landroid/widget/TextView;

    .line 29
    const v0, 0x7f10037a

    invoke-virtual {p0, v0}, Lcom/vkontakte/android/ui/holder/messages/LinkHolder;->$(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/widget/TextView;

    iput-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/LinkHolder;->thumb:Landroid/widget/TextView;

    .line 30
    return-void
.end method


# virtual methods
.method public onBind(Lcom/vkontakte/android/Link;)V
    .locals 2
    .param p1, "item"    # Lcom/vkontakte/android/Link;

    .prologue
    .line 34
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/LinkHolder;->imageView:Lcom/vk/imageloader/view/VKImageView;

    iget-object v1, p1, Lcom/vkontakte/android/Link;->image_src:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 35
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/LinkHolder;->title:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/Link;->title:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 36
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/LinkHolder;->title:Landroid/widget/TextView;

    invoke-virtual {p1}, Lcom/vkontakte/android/Link;->getDisplayText()Ljava/lang/CharSequence;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 37
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/LinkHolder;->link:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/Link;->url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 38
    iget-object v0, p0, Lcom/vkontakte/android/ui/holder/messages/LinkHolder;->thumb:Landroid/widget/TextView;

    iget-object v1, p1, Lcom/vkontakte/android/Link;->thumb:Ljava/lang/String;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 39
    return-void
.end method

.method public bridge synthetic onBind(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 19
    check-cast p1, Lcom/vkontakte/android/Link;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/holder/messages/LinkHolder;->onBind(Lcom/vkontakte/android/Link;)V

    return-void
.end method

.method public onClick()V
    .locals 4

    .prologue
    .line 44
    :try_start_0
    new-instance v1, Landroid/content/Intent;

    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/messages/LinkHolder;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    const-class v3, Lcom/vkontakte/android/LinkRedirActivity;

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 45
    .local v1, "intent":Landroid/content/Intent;
    invoke-virtual {p0}, Lcom/vkontakte/android/ui/holder/messages/LinkHolder;->getItem()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/Link;

    iget-object v2, v2, Lcom/vkontakte/android/Link;->url:Ljava/lang/String;

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 46
    iget-object v2, p0, Lcom/vkontakte/android/ui/holder/messages/LinkHolder;->itemView:Landroid/view/View;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    .end local v1    # "intent":Landroid/content/Intent;
    :goto_0
    return-void

    .line 47
    :catch_0
    move-exception v0

    .line 48
    .local v0, "e":Ljava/lang/Exception;
    const/4 v2, 0x0

    new-array v2, v2, [Ljava/lang/Object;

    invoke-static {v0, v2}, Lcom/vkontakte/android/utils/L;->e(Ljava/lang/Throwable;[Ljava/lang/Object;)V

    goto :goto_0
.end method
