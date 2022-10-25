.class public Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem;
.super Lcom/vkontakte/android/ui/posts/PostDisplayItem;
.source "ActivityCommentDisplayItem.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;
    }
.end annotation


# instance fields
.field private final newsEntry:Lcom/vkontakte/android/NewsEntry;

.field private final referrer:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/NewsEntry;Ljava/lang/String;)V
    .locals 0
    .param p1, "newsEntry"    # Lcom/vkontakte/android/NewsEntry;
    .param p2, "referrer"    # Ljava/lang/String;

    .prologue
    .line 23
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/posts/PostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    .line 24
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem;->newsEntry:Lcom/vkontakte/android/NewsEntry;

    .line 25
    iput-object p2, p0, Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem;->referrer:Ljava/lang/String;

    .line 26
    return-void
.end method

.method public static createView(Landroid/content/Context;)Landroid/view/View;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x0

    .line 61
    const v2, 0x7f0301b0

    invoke-static {p0, v2, v3}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 62
    .local v1, "view":Landroid/view/View;
    new-instance v0, Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;

    invoke-direct {v0, v3}, Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;-><init>(Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$1;)V

    .line 63
    .local v0, "holder":Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;
    const v2, 0x7f100405

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/vk/imageloader/view/VKImageView;

    invoke-static {v0, v2}, Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;->access$302(Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;Lcom/vk/imageloader/view/VKImageView;)Lcom/vk/imageloader/view/VKImageView;

    .line 64
    const v2, 0x7f100128

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    invoke-static {v0, v2}, Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;->access$002(Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;Landroid/widget/TextView;)Landroid/widget/TextView;

    .line 65
    const v2, 0x7f1001c3

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    invoke-static {v0, v2}, Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;->access$102(Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;Landroid/widget/TextView;)Landroid/widget/TextView;

    .line 66
    const v2, 0x7f10000e

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v0, v2}, Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;->access$202(Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;Landroid/view/View;)Landroid/view/View;

    .line 67
    invoke-virtual {v1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 68
    return-object v1
.end method


# virtual methods
.method public getImageCount()I
    .locals 1

    .prologue
    .line 35
    const/4 v0, 0x1

    return v0
.end method

.method public getImageURL(I)Ljava/lang/String;
    .locals 2
    .param p1, "image"    # I

    .prologue
    .line 40
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem;->newsEntry:Lcom/vkontakte/android/NewsEntry;

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->activity:Lcom/vkontakte/android/NewsEntry$Activity;

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry$Activity;->photos:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 30
    const/16 v0, 0x13

    return v0
.end method

.method public onBindView(Landroid/view/View;)V
    .locals 6
    .param p1, "view"    # Landroid/view/View;

    .prologue
    const/4 v5, 0x0

    .line 45
    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem;->newsEntry:Lcom/vkontakte/android/NewsEntry;

    iget-object v2, v2, Lcom/vkontakte/android/NewsEntry;->activity:Lcom/vkontakte/android/NewsEntry$Activity;

    iget-object v2, v2, Lcom/vkontakte/android/NewsEntry$Activity;->commentText:Ljava/lang/String;

    const/16 v3, 0xa

    const/16 v4, 0x20

    invoke-virtual {v2, v3, v4}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    .line 46
    .local v1, "text":Ljava/lang/String;
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;

    .line 47
    .local v0, "holder":Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;
    invoke-static {v0}, Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;->access$000(Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v3

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem;->newsEntry:Lcom/vkontakte/android/NewsEntry;

    iget-object v2, v2, Lcom/vkontakte/android/NewsEntry;->activity:Lcom/vkontakte/android/NewsEntry$Activity;

    iget-object v2, v2, Lcom/vkontakte/android/NewsEntry$Activity;->users:Ljava/util/ArrayList;

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/CharSequence;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 48
    invoke-static {v0}, Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;->access$100(Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v2

    invoke-static {v1}, Lcom/vkontakte/android/LinkParser;->stripMentions(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lcom/vkontakte/android/Global;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 49
    invoke-static {v0}, Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;->access$200(Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 50
    invoke-static {v0}, Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;->access$300(Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem$ViewHolder;)Lcom/vk/imageloader/view/VKImageView;

    move-result-object v3

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem;->newsEntry:Lcom/vkontakte/android/NewsEntry;

    iget-object v2, v2, Lcom/vkontakte/android/NewsEntry;->activity:Lcom/vkontakte/android/NewsEntry$Activity;

    iget-object v2, v2, Lcom/vkontakte/android/NewsEntry$Activity;->photos:Ljava/util/ArrayList;

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {v3, v2}, Lcom/vk/imageloader/view/VKImageView;->load(Ljava/lang/String;)V

    .line 51
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 2
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 55
    new-instance v0, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem;->newsEntry:Lcom/vkontakte/android/NewsEntry;

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem;->referrer:Ljava/lang/String;

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->setRefer(Ljava/lang/String;)Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    move-result-object v0

    iget-object v1, p0, Lcom/vkontakte/android/ui/posts/ActivityCommentDisplayItem;->newsEntry:Lcom/vkontakte/android/NewsEntry;

    iget-object v1, v1, Lcom/vkontakte/android/NewsEntry;->activity:Lcom/vkontakte/android/NewsEntry$Activity;

    iget v1, v1, Lcom/vkontakte/android/NewsEntry$Activity;->commentID:I

    .line 56
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->setComment(I)Lcom/vkontakte/android/fragments/PostViewFragment$Builder;

    move-result-object v0

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/PostViewFragment$Builder;->go(Landroid/content/Context;)Z

    .line 57
    return-void
.end method
