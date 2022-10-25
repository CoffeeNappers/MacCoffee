.class public Lcom/vkontakte/android/ui/posts/ButtonsPostDisplayItem;
.super Lcom/vkontakte/android/ui/posts/PostDisplayItem;
.source "ButtonsPostDisplayItem.java"


# instance fields
.field private post:Lcom/vkontakte/android/NewsEntry;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/NewsEntry;)V
    .locals 0
    .param p1, "e"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    .line 21
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/posts/PostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    .line 22
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/ButtonsPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    .line 23
    return-void
.end method

.method public static createView(Landroid/content/Context;)Landroid/view/View;
    .locals 2
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    .line 41
    const v0, 0x7f030067

    const/4 v1, 0x0

    invoke-static {p0, v0, v1}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v0

    return-object v0
.end method


# virtual methods
.method public getImageCount()I
    .locals 1

    .prologue
    .line 32
    const/4 v0, 0x0

    return v0
.end method

.method public getImageURL(I)Ljava/lang/String;
    .locals 1
    .param p1, "image"    # I

    .prologue
    .line 37
    const/4 v0, 0x0

    return-object v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 27
    const/16 v0, 0xa

    return v0
.end method

.method synthetic lambda$null$1(Landroid/view/View;Landroid/content/DialogInterface;I)V
    .locals 2
    .param p1, "v1"    # Landroid/view/View;
    .param p2, "dialog"    # Landroid/content/DialogInterface;
    .param p3, "which"    # I

    .prologue
    .line 69
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ButtonsPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/data/Posts;->deletePost(Lcom/vkontakte/android/NewsEntry;Landroid/content/Context;)V

    .line 70
    return-void
.end method

.method synthetic lambda$onBindView$0(Landroid/view/View;)V
    .locals 3
    .param p1, "v1"    # Landroid/view/View;

    .prologue
    .line 54
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ButtonsPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    neg-int v1, v1

    invoke-static {v1}, Lcom/vkontakte/android/data/Groups;->getById(I)Lcom/vkontakte/android/api/Group;

    move-result-object v0

    .line 63
    .local v0, "g":Lcom/vkontakte/android/api/Group;
    new-instance v1, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    invoke-direct {v1}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;-><init>()V

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/ButtonsPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->attachPost(Lcom/vkontakte/android/NewsEntry;)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->attachGroup(Lcom/vkontakte/android/api/Group;)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->isPublic(Z)Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;

    move-result-object v1

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/fragments/news/NewPostFragment$Builder;->go(Landroid/content/Context;)Z

    .line 64
    return-void
.end method

.method synthetic lambda$onBindView$2(Landroid/view/View;)V
    .locals 3
    .param p1, "v1"    # Landroid/view/View;

    .prologue
    .line 65
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f080176

    .line 66
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f0801a3

    .line 67
    invoke-virtual {v0, v1}, Landroid/app/AlertDialog$Builder;->setMessage(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080798

    invoke-static {p0, p1}, Lcom/vkontakte/android/ui/posts/ButtonsPostDisplayItem$$Lambda$3;->lambdaFactory$(Lcom/vkontakte/android/ui/posts/ButtonsPostDisplayItem;Landroid/view/View;)Landroid/content/DialogInterface$OnClickListener;

    move-result-object v2

    .line 68
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080433

    const/4 v2, 0x0

    .line 71
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setNegativeButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    .line 72
    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 65
    return-void
.end method

.method public onBindView(Landroid/view/View;)V
    .locals 3
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const v2, 0x7f100253

    .line 47
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ButtonsPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_1

    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ButtonsPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ButtonsPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget-object v1, v1, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lcom/vkontakte/android/attachments/ThumbAttachment;

    if-nez v0, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ButtonsPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ButtonsPostDisplayItem;->post:Lcom/vkontakte/android/NewsEntry;

    iget-object v1, v1, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lcom/vkontakte/android/attachments/SnippetAttachment;

    if-eqz v0, :cond_1

    .line 48
    :cond_0
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    .line 53
    :goto_0
    const v0, 0x7f100257

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {p0}, Lcom/vkontakte/android/ui/posts/ButtonsPostDisplayItem$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ui/posts/ButtonsPostDisplayItem;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 65
    const v0, 0x7f100258

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {p0}, Lcom/vkontakte/android/ui/posts/ButtonsPostDisplayItem$$Lambda$2;->lambdaFactory$(Lcom/vkontakte/android/ui/posts/ButtonsPostDisplayItem;)Landroid/view/View$OnClickListener;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 73
    return-void

    .line 50
    :cond_1
    invoke-virtual {p1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_0
.end method
