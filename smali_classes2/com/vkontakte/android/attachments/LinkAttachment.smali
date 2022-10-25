.class public Lcom/vkontakte/android/attachments/LinkAttachment;
.super Lcom/vkontakte/android/attachments/Attachment;
.source "LinkAttachment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;
.implements Landroid/view/View$OnLongClickListener;


# static fields
.field public static final CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/vkontakte/android/utils/Serializer$Creator",
            "<",
            "Lcom/vkontakte/android/attachments/LinkAttachment;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private post:Lcom/vkontakte/android/NewsEntry;

.field private transient postInteract:Lcom/vkontakte/android/data/PostInteract;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field

.field public previewPage:Ljava/lang/String;

.field public referWiki:Ljava/lang/String;

.field public title:Ljava/lang/String;

.field public url:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 35
    new-instance v0, Lcom/vkontakte/android/attachments/LinkAttachment$1;

    invoke-direct {v0}, Lcom/vkontakte/android/attachments/LinkAttachment$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/attachments/LinkAttachment;->CREATOR:Lcom/vkontakte/android/utils/Serializer$Creator;

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "_url"    # Ljava/lang/String;
    .param p2, "_title"    # Ljava/lang/String;
    .param p3, "preview"    # Ljava/lang/String;

    .prologue
    .line 29
    invoke-direct {p0}, Lcom/vkontakte/android/attachments/Attachment;-><init>()V

    .line 30
    iput-object p1, p0, Lcom/vkontakte/android/attachments/LinkAttachment;->url:Ljava/lang/String;

    .line 31
    iput-object p2, p0, Lcom/vkontakte/android/attachments/LinkAttachment;->title:Ljava/lang/String;

    .line 32
    iput-object p3, p0, Lcom/vkontakte/android/attachments/LinkAttachment;->previewPage:Ljava/lang/String;

    .line 33
    return-void
.end method


# virtual methods
.method public getFullView(Landroid/content/Context;)Landroid/view/View;
    .locals 1
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 55
    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lcom/vkontakte/android/attachments/LinkAttachment;->getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method

.method public getViewForList(Landroid/content/Context;Landroid/view/View;)Landroid/view/View;
    .locals 4
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "reuse"    # Landroid/view/View;

    .prologue
    .line 93
    if-nez p2, :cond_0

    const-string/jumbo v1, "common"

    invoke-static {p1, v1}, Lcom/vkontakte/android/attachments/LinkAttachment;->getReusableView(Landroid/content/Context;Ljava/lang/String;)Landroid/view/View;

    move-result-object v0

    .line 94
    .local v0, "v":Landroid/view/View;
    :goto_0
    const v1, 0x7f1001ef

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/ImageView;

    const v2, 0x7f01000e

    invoke-static {p1, v2}, Lcom/vkontakte/android/ViewUtils;->getResFromTheme(Landroid/content/Context;I)I

    move-result v2

    invoke-virtual {v1, v2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 95
    const v1, 0x7f1001dc

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/vkontakte/android/attachments/LinkAttachment;->title:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-lez v2, :cond_1

    iget-object v2, p0, Lcom/vkontakte/android/attachments/LinkAttachment;->title:Ljava/lang/String;

    :goto_1
    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 97
    const v1, 0x7f1001dd

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    iget-object v2, p0, Lcom/vkontakte/android/attachments/LinkAttachment;->url:Ljava/lang/String;

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v2}, Landroid/net/Uri;->getAuthority()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 98
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 99
    invoke-virtual {v0, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    .line 100
    return-object v0

    .end local v0    # "v":Landroid/view/View;
    :cond_0
    move-object v0, p2

    .line 93
    goto :goto_0

    .line 95
    .restart local v0    # "v":Landroid/view/View;
    :cond_1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0800d7

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_1
.end method

.method public onClick(Landroid/view/View;)V
    .locals 6
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v3, 0x1

    .line 60
    invoke-static {}, Lcom/vk/core/network/Network;->getInstance()Lcom/vk/core/network/Network;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/core/network/Network;->proxy()Lcom/vk/core/network/NetworkProxy;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vk/core/network/NetworkProxy;->isEnable()Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Lcom/vkontakte/android/attachments/LinkAttachment;->previewPage:Ljava/lang/String;

    if-eqz v1, :cond_2

    iget-object v1, p0, Lcom/vkontakte/android/attachments/LinkAttachment;->previewPage:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_2

    .line 61
    iget-object v1, p0, Lcom/vkontakte/android/attachments/LinkAttachment;->previewPage:Ljava/lang/String;

    const-string/jumbo v2, "_"

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v0

    .line 62
    .local v0, "sp":[Ljava/lang/String;
    new-instance v1, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;

    invoke-direct {v1}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;-><init>()V

    const/4 v2, 0x0

    aget-object v2, v0, v2

    .line 63
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->setOid(I)Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;

    move-result-object v1

    aget-object v2, v0, v3

    .line 64
    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->setPid(I)Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/attachments/LinkAttachment;->referWiki:Ljava/lang/String;

    .line 65
    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->setRefer(Ljava/lang/String;)Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;

    move-result-object v1

    .line 66
    invoke-virtual {v1, v3}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->setSite(Z)Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/WikiViewFragment$Builder;->go(Landroid/content/Context;)Z

    .line 70
    .end local v0    # "sp":[Ljava/lang/String;
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/attachments/LinkAttachment;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    if-eqz v1, :cond_0

    .line 71
    iget-object v1, p0, Lcom/vkontakte/android/attachments/LinkAttachment;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    sget-object v2, Lcom/vkontakte/android/data/PostInteract$Type;->attached_link_click:Lcom/vkontakte/android/data/PostInteract$Type;

    iget-object v3, p0, Lcom/vkontakte/android/attachments/LinkAttachment;->url:Ljava/lang/String;

    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/data/PostInteract;->sendNow(Lcom/vkontakte/android/data/PostInteract$Type;Ljava/lang/String;)V

    .line 73
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/attachments/LinkAttachment;->post:Lcom/vkontakte/android/NewsEntry;

    if-eqz v1, :cond_1

    .line 74
    iget-object v1, p0, Lcom/vkontakte/android/attachments/LinkAttachment;->post:Lcom/vkontakte/android/NewsEntry;

    const-string/jumbo v2, "click_post_link"

    invoke-static {v1, v2}, Lcom/vkontakte/android/data/Analytics;->sendPromoPostActionByType(Lcom/vkontakte/android/NewsEntry;Ljava/lang/String;)V

    .line 76
    :cond_1
    return-void

    .line 68
    :cond_2
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Landroid/content/Intent;

    const-string/jumbo v3, "android.intent.action.VIEW"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "vklink://view/?"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p0, Lcom/vkontakte/android/attachments/LinkAttachment;->url:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v1, v2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto :goto_0
.end method

.method public onLongClick(Landroid/view/View;)Z
    .locals 5
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 80
    iget-object v0, p0, Lcom/vkontakte/android/attachments/LinkAttachment;->previewPage:Ljava/lang/String;

    if-eqz v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/attachments/LinkAttachment;->previewPage:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_1

    .line 81
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.VIEW"

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "vklink://view/?"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/attachments/LinkAttachment;->url:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    invoke-virtual {v0, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 82
    iget-object v0, p0, Lcom/vkontakte/android/attachments/LinkAttachment;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    if-eqz v0, :cond_0

    .line 83
    iget-object v0, p0, Lcom/vkontakte/android/attachments/LinkAttachment;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    sget-object v1, Lcom/vkontakte/android/data/PostInteract$Type;->link_click:Lcom/vkontakte/android/data/PostInteract$Type;

    iget-object v2, p0, Lcom/vkontakte/android/attachments/LinkAttachment;->url:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/data/PostInteract;->sendNow(Lcom/vkontakte/android/data/PostInteract$Type;Ljava/lang/String;)V

    .line 85
    :cond_0
    const/4 v0, 0x1

    .line 87
    :goto_0
    return v0

    :cond_1
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public serializeTo(Lcom/vkontakte/android/utils/Serializer;)V
    .locals 1
    .param p1, "s"    # Lcom/vkontakte/android/utils/Serializer;

    .prologue
    .line 48
    iget-object v0, p0, Lcom/vkontakte/android/attachments/LinkAttachment;->url:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 49
    iget-object v0, p0, Lcom/vkontakte/android/attachments/LinkAttachment;->title:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 50
    iget-object v0, p0, Lcom/vkontakte/android/attachments/LinkAttachment;->previewPage:Ljava/lang/String;

    invoke-virtual {p1, v0}, Lcom/vkontakte/android/utils/Serializer;->writeString(Ljava/lang/String;)V

    .line 51
    return-void
.end method

.method public setReferrer(Lcom/vkontakte/android/NewsEntry;Lcom/vkontakte/android/data/PostInteract;)V
    .locals 0
    .param p1, "e"    # Lcom/vkontakte/android/NewsEntry;
    .param p2, "postInteract"    # Lcom/vkontakte/android/data/PostInteract;

    .prologue
    .line 108
    iput-object p1, p0, Lcom/vkontakte/android/attachments/LinkAttachment;->post:Lcom/vkontakte/android/NewsEntry;

    .line 109
    iput-object p2, p0, Lcom/vkontakte/android/attachments/LinkAttachment;->postInteract:Lcom/vkontakte/android/data/PostInteract;

    .line 110
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .prologue
    .line 104
    iget-object v0, p0, Lcom/vkontakte/android/attachments/LinkAttachment;->url:Ljava/lang/String;

    const-string/jumbo v1, "http:"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/attachments/LinkAttachment;->url:Ljava/lang/String;

    const-string/jumbo v1, "https:"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    iget-object v0, p0, Lcom/vkontakte/android/attachments/LinkAttachment;->url:Ljava/lang/String;

    :goto_0
    return-object v0

    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v1, "http://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/attachments/LinkAttachment;->url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    goto :goto_0
.end method
