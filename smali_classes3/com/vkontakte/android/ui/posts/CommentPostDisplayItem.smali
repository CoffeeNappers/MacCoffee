.class public Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem;
.super Lcom/vkontakte/android/ui/posts/PostDisplayItem;
.source "CommentPostDisplayItem.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem$ViewHolder;
    }
.end annotation


# instance fields
.field public id:I

.field public numComments:I

.field public text:Ljava/lang/String;

.field public time:I

.field public userName:Ljava/lang/String;

.field public userPhoto:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/NewsEntry;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;III)V
    .locals 0
    .param p1, "entry"    # Lcom/vkontakte/android/NewsEntry;
    .param p2, "_text"    # Ljava/lang/String;
    .param p3, "_userName"    # Ljava/lang/String;
    .param p4, "_userPhoto"    # Ljava/lang/String;
    .param p5, "_numComments"    # I
    .param p6, "_time"    # I
    .param p7, "_id"    # I

    .prologue
    .line 22
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/posts/PostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    .line 23
    iput-object p2, p0, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem;->text:Ljava/lang/String;

    .line 24
    iput-object p3, p0, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem;->userName:Ljava/lang/String;

    .line 25
    iput-object p4, p0, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem;->userPhoto:Ljava/lang/String;

    .line 26
    iput p5, p0, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem;->numComments:I

    .line 27
    iput p6, p0, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem;->time:I

    .line 28
    iput p7, p0, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem;->id:I

    .line 29
    return-void
.end method

.method public static createView(Landroid/content/Context;)Landroid/view/View;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x0

    .line 47
    const v2, 0x7f03015b

    invoke-static {p0, v2, v3}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 48
    .local v1, "view":Landroid/view/View;
    new-instance v0, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem$ViewHolder;

    invoke-direct {v0, v3}, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem$ViewHolder;-><init>(Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem$1;)V

    .line 49
    .local v0, "holder":Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem$ViewHolder;
    const v2, 0x7f1003fb

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem$ViewHolder;->title:Landroid/widget/TextView;

    .line 50
    const v2, 0x7f1003fe

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem$ViewHolder;->text:Landroid/widget/TextView;

    .line 51
    const v2, 0x7f1003fd

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem$ViewHolder;->name:Landroid/widget/TextView;

    .line 52
    const v2, 0x7f1003ff

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    iput-object v2, v0, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem$ViewHolder;->time:Landroid/widget/TextView;

    .line 53
    const v2, 0x7f1003fc

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/vk/imageloader/view/VKImageView;

    iput-object v2, v0, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem$ViewHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    .line 54
    invoke-virtual {v1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 55
    return-object v1
.end method


# virtual methods
.method public getImageCount()I
    .locals 1

    .prologue
    .line 38
    const/4 v0, 0x1

    return v0
.end method

.method public getImageURL(I)Ljava/lang/String;
    .locals 1
    .param p1, "image"    # I

    .prologue
    .line 43
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem;->userPhoto:Ljava/lang/String;

    return-object v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 33
    const/4 v0, 0x4

    return v0
.end method

.method synthetic lambda$onBindView$0(Landroid/view/View;)V
    .locals 2
    .param p1, "v"    # Landroid/view/View;

    .prologue
    .line 74
    new-instance v0, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;

    iget v1, p0, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem;->id:I

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;-><init>(I)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment$Builder;->go(Landroid/content/Context;)Z

    return-void
.end method

.method public onBindView(Landroid/view/View;)V
    .locals 8
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v5, 0x1

    const/4 v7, 0x0

    .line 60
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem$ViewHolder;

    .line 61
    .local v0, "holder":Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem$ViewHolder;
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem$ViewHolder;->text:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem;->text:Ljava/lang/String;

    invoke-static {v2}, Lcom/vkontakte/android/Global;->replaceHTML(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "\\[id(\\d+)\\|([^\\]]+)\\]"

    const-string/jumbo v4, "$2"

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/Global;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 62
    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem;->text:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_0

    .line 63
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem$ViewHolder;->text:Landroid/widget/TextView;

    const/16 v2, 0x8

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setVisibility(I)V

    .line 67
    :goto_0
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem$ViewHolder;->name:Landroid/widget/TextView;

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem;->userName:Ljava/lang/String;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 68
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem$ViewHolder;->time:Landroid/widget/TextView;

    iget v2, p0, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem;->time:I

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/vkontakte/android/TimeUtils;->langDateRelative(ILandroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 69
    iget v1, p0, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem;->numComments:I

    if-le v1, v5, :cond_1

    .line 70
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem$ViewHolder;->title:Landroid/widget/TextView;

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0d0034

    iget v4, p0, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem;->numComments:I

    new-array v5, v5, [Ljava/lang/Object;

    iget v6, p0, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem;->numComments:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    aput-object v6, v5, v7

    invoke-virtual {v2, v3, v4, v5}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 74
    :goto_1
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem$ViewHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    invoke-static {p0}, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem;)Landroid/view/View$OnClickListener;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 75
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem$ViewHolder;->photo:Lcom/vk/imageloader/view/VKImageView;

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem;->userPhoto:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 76
    return-void

    .line 65
    :cond_0
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem$ViewHolder;->text:Landroid/widget/TextView;

    invoke-virtual {v1, v7}, Landroid/widget/TextView;->setVisibility(I)V

    goto :goto_0

    .line 72
    :cond_1
    iget-object v1, v0, Lcom/vkontakte/android/ui/posts/CommentPostDisplayItem$ViewHolder;->title:Landroid/widget/TextView;

    const v2, 0x7f08015b

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(I)V

    goto :goto_1
.end method
