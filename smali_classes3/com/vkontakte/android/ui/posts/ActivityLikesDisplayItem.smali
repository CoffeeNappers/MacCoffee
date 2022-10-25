.class public Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem;
.super Lcom/vkontakte/android/ui/posts/PostDisplayItem;
.source "ActivityLikesDisplayItem.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;
    }
.end annotation


# static fields
.field private static final MAX_STRIP_PHOTOS:I = 0x3


# instance fields
.field private final newsEntry:Lcom/vkontakte/android/NewsEntry;


# direct methods
.method public constructor <init>(Lcom/vkontakte/android/NewsEntry;)V
    .locals 0
    .param p1, "newsEntry"    # Lcom/vkontakte/android/NewsEntry;

    .prologue
    .line 23
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ui/posts/PostDisplayItem;-><init>(Lcom/vkontakte/android/NewsEntry;)V

    .line 24
    iput-object p1, p0, Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem;->newsEntry:Lcom/vkontakte/android/NewsEntry;

    .line 25
    return-void
.end method

.method public static createView(Landroid/content/Context;)Landroid/view/View;
    .locals 4
    .param p0, "context"    # Landroid/content/Context;

    .prologue
    const/4 v3, 0x0

    .line 66
    const v2, 0x7f0301b1

    invoke-static {p0, v2, v3}, Landroid/view/View;->inflate(Landroid/content/Context;ILandroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v1

    .line 67
    .local v1, "view":Landroid/view/View;
    new-instance v0, Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;

    invoke-direct {v0, v3}, Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;-><init>(Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$1;)V

    .line 68
    .local v0, "holder":Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;
    const v2, 0x7f1004c2

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/ui/PhotoStripView;

    invoke-static {v0, v2}, Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;->access$002(Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;Lcom/vkontakte/android/ui/PhotoStripView;)Lcom/vkontakte/android/ui/PhotoStripView;

    .line 69
    const v2, 0x7f1001c3

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    invoke-static {v0, v2}, Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;->access$102(Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;Landroid/widget/TextView;)Landroid/widget/TextView;

    .line 70
    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;->access$202(Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;Landroid/view/View;)Landroid/view/View;

    .line 71
    invoke-virtual {v1, v0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    .line 72
    return-object v1
.end method


# virtual methods
.method public getImageCount()I
    .locals 2

    .prologue
    .line 34
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem;->newsEntry:Lcom/vkontakte/android/NewsEntry;

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->activity:Lcom/vkontakte/android/NewsEntry$Activity;

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry$Activity;->photos:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x3

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    return v0
.end method

.method public getImageURL(I)Ljava/lang/String;
    .locals 1
    .param p1, "image"    # I

    .prologue
    .line 39
    iget-object v0, p0, Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem;->newsEntry:Lcom/vkontakte/android/NewsEntry;

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry;->activity:Lcom/vkontakte/android/NewsEntry$Activity;

    iget-object v0, v0, Lcom/vkontakte/android/NewsEntry$Activity;->photos:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    return-object v0
.end method

.method public getType()I
    .locals 1

    .prologue
    .line 29
    const/16 v0, 0x12

    return v0
.end method

.method public onBindView(Landroid/view/View;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 44
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;

    .line 45
    .local v0, "holder":Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;
    invoke-static {v0}, Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;->access$000(Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;)Lcom/vkontakte/android/ui/PhotoStripView;

    move-result-object v1

    const/high16 v2, 0x40000000    # 2.0f

    invoke-static {v2}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/PhotoStripView;->setPadding(I)V

    .line 46
    invoke-static {v0}, Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;->access$000(Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;)Lcom/vkontakte/android/ui/PhotoStripView;

    move-result-object v1

    const v2, 0x3f4ccccd    # 0.8f

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/PhotoStripView;->setOverlapOffset(F)V

    .line 47
    invoke-static {v0}, Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;->access$000(Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;)Lcom/vkontakte/android/ui/PhotoStripView;

    move-result-object v1

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem;->getImageCount()I

    move-result v2

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/PhotoStripView;->setCount(I)V

    .line 48
    invoke-static {v0}, Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;->access$100(Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;)Landroid/widget/TextView;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem;->newsEntry:Lcom/vkontakte/android/NewsEntry;

    iget-object v2, v2, Lcom/vkontakte/android/NewsEntry;->activity:Lcom/vkontakte/android/NewsEntry$Activity;

    iget-object v2, v2, Lcom/vkontakte/android/NewsEntry$Activity;->likesText:Ljava/lang/String;

    invoke-static {v2}, Lcom/vkontakte/android/LinkParser;->stripMentions(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/vkontakte/android/Global;->replaceEmoji(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 49
    invoke-static {v0}, Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;->access$200(Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 50
    invoke-static {v0}, Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;->access$000(Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem$ViewHolder;)Lcom/vkontakte/android/ui/PhotoStripView;

    move-result-object v1

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem;->newsEntry:Lcom/vkontakte/android/NewsEntry;

    iget-object v2, v2, Lcom/vkontakte/android/NewsEntry;->activity:Lcom/vkontakte/android/NewsEntry$Activity;

    iget-object v2, v2, Lcom/vkontakte/android/NewsEntry$Activity;->photos:Ljava/util/ArrayList;

    invoke-virtual {p0}, Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem;->getImageCount()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Lcom/vkontakte/android/ui/PhotoStripView;->load(Ljava/util/List;I)V

    .line 51
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 4
    .param p1, "view"    # Landroid/view/View;

    .prologue
    .line 55
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 56
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "title"

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f080337

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putCharSequence(Ljava/lang/String;Ljava/lang/CharSequence;)V

    .line 57
    const-string/jumbo v1, "ltype"

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem;->newsEntry:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->type:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 58
    const-string/jumbo v1, "oid"

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem;->newsEntry:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->ownerID:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 59
    const-string/jumbo v1, "item_id"

    iget-object v2, p0, Lcom/vkontakte/android/ui/posts/ActivityLikesDisplayItem;->newsEntry:Lcom/vkontakte/android/NewsEntry;

    iget v2, v2, Lcom/vkontakte/android/NewsEntry;->postID:I

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 60
    const-string/jumbo v1, "tab"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 61
    const-class v1, Lcom/vkontakte/android/fragments/LikesListFragment;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-static {v1, v0, v2}, Lcom/vkontakte/android/navigation/Navigate;->to(Ljava/lang/Class;Landroid/os/Bundle;Landroid/content/Context;)V

    .line 62
    return-void
.end method
