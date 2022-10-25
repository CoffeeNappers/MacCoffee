.class Lcom/vkontakte/android/fragments/PostViewFragment$34;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "PostViewFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/fragments/PostViewFragment;->loadVideoInfo()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<",
        "Lcom/vkontakte/android/api/video/VideoGetInfo$Result;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/PostViewFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/PostViewFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/PostViewFragment;

    .prologue
    .line 2101
    iput-object p1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$34;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-direct {p0}, Lcom/vkontakte/android/api/SimpleCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public success(Lcom/vkontakte/android/api/video/VideoGetInfo$Result;)V
    .locals 11
    .param p1, "r"    # Lcom/vkontakte/android/api/video/VideoGetInfo$Result;

    .prologue
    const/4 v1, 0x0

    .line 2104
    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$34;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v2

    const/16 v4, 0x8

    iget-boolean v5, p1, Lcom/vkontakte/android/api/video/VideoGetInfo$Result;->isLiked:Z

    invoke-virtual {v2, v4, v5}, Lcom/vkontakte/android/NewsEntry;->flag(IZ)V

    .line 2105
    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$34;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$000(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/NewsEntry;

    move-result-object v2

    iget v4, p1, Lcom/vkontakte/android/api/video/VideoGetInfo$Result;->numLikes:I

    iput v4, v2, Lcom/vkontakte/android/NewsEntry;->numLikes:I

    .line 2106
    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$34;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$100(Lcom/vkontakte/android/fragments/PostViewFragment;)V

    .line 2107
    iget-object v2, p1, Lcom/vkontakte/android/api/video/VideoGetInfo$Result;->tags:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-lez v2, :cond_1

    .line 2108
    new-instance v3, Landroid/text/SpannableStringBuilder;

    invoke-direct {v3}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 2109
    .local v3, "ssb":Landroid/text/SpannableStringBuilder;
    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$34;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-virtual {v2}, Lcom/vkontakte/android/fragments/PostViewFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v4, 0x7f080319

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 2110
    new-instance v2, Landroid/text/style/ForegroundColorSpan;

    const v4, -0x555556

    invoke-direct {v2, v4}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {v3}, Landroid/text/SpannableStringBuilder;->length()I

    move-result v4

    invoke-virtual {v3, v2, v1, v4, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 2111
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 2112
    .local v10, "tt":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    iget-object v2, p1, Lcom/vkontakte/android/api/video/VideoGetInfo$Result;->tags:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_0

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lcom/vkontakte/android/UserProfile;

    .line 2113
    .local v8, "p":Lcom/vkontakte/android/UserProfile;
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "[id"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget v5, v8, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "|"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, v8, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, "]"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v10, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 2115
    .end local v8    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_0
    const-string/jumbo v2, ", "

    invoke-static {v2, v10}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object v9

    .line 2116
    .local v9, "t":Ljava/lang/String;
    const-string/jumbo v2, " "

    invoke-virtual {v3, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 2117
    const/4 v2, 0x2

    invoke-static {v9, v2}, Lcom/vkontakte/android/LinkParser;->parseLinks(Ljava/lang/CharSequence;I)Ljava/lang/CharSequence;

    move-result-object v2

    invoke-virtual {v3, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 2118
    new-instance v0, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;

    const/4 v4, 0x0

    const/4 v6, 0x1

    iget-object v2, p0, Lcom/vkontakte/android/fragments/PostViewFragment$34;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$2300(Lcom/vkontakte/android/fragments/PostViewFragment;)Lcom/vkontakte/android/data/PostInteract;

    move-result-object v7

    move v2, v1

    move v5, v1

    invoke-direct/range {v0 .. v7}, Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;-><init>(IILjava/lang/CharSequence;Ljava/lang/String;ZZLcom/vkontakte/android/data/PostInteract;)V

    .line 2119
    .local v0, "item":Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$34;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->access$400(Lcom/vkontakte/android/fragments/PostViewFragment;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2120
    iget-object v1, p0, Lcom/vkontakte/android/fragments/PostViewFragment$34;->this$0:Lcom/vkontakte/android/fragments/PostViewFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/PostViewFragment;->updateList()V

    .line 2122
    .end local v0    # "item":Lcom/vkontakte/android/ui/posts/TextPostDisplayItem;
    .end local v3    # "ssb":Landroid/text/SpannableStringBuilder;
    .end local v9    # "t":Ljava/lang/String;
    .end local v10    # "tt":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_1
    return-void
.end method

.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 2101
    check-cast p1, Lcom/vkontakte/android/api/video/VideoGetInfo$Result;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/PostViewFragment$34;->success(Lcom/vkontakte/android/api/video/VideoGetInfo$Result;)V

    return-void
.end method
