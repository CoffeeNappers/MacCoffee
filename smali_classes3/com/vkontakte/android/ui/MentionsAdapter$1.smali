.class Lcom/vkontakte/android/ui/MentionsAdapter$1;
.super Lcom/vkontakte/android/fragments/friends/SearchIndexer$SimpleProvider;
.source "MentionsAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/ui/MentionsAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/friends/SearchIndexer$SimpleProvider",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/MentionsAdapter;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/MentionsAdapter;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/MentionsAdapter;

    .prologue
    .line 124
    iput-object p1, p0, Lcom/vkontakte/android/ui/MentionsAdapter$1;->this$0:Lcom/vkontakte/android/ui/MentionsAdapter;

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/friends/SearchIndexer$SimpleProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public getIndexChar(Lcom/vkontakte/android/UserProfile;)[C
    .locals 5
    .param p1, "from"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    const/16 v1, 0x20

    const/4 v4, 0x0

    .line 127
    const/4 v0, 0x5

    new-array v2, v0, [C

    const/16 v0, 0x25

    aput-char v0, v2, v4

    const/4 v0, 0x1

    const/16 v3, 0x69

    aput-char v3, v2, v0

    const/4 v3, 0x2

    iget-object v0, p1, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    .line 130
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_1

    move v0, v1

    :goto_0
    aput-char v0, v2, v3

    const/4 v3, 0x3

    iget-object v0, p1, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    .line 131
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_2

    move v0, v1

    :goto_1
    aput-char v0, v2, v3

    const/4 v0, 0x4

    iget-object v3, p1, Lcom/vkontakte/android/UserProfile;->domain:Ljava/lang/String;

    if-eqz v3, :cond_0

    .line 132
    invoke-virtual {p1}, Lcom/vkontakte/android/UserProfile;->getHasRealDomain()Z

    move-result v3

    if-nez v3, :cond_3

    :cond_0
    :goto_2
    aput-char v1, v2, v0

    return-object v2

    .line 130
    :cond_1
    iget-object v0, p1, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v0

    goto :goto_0

    .line 131
    :cond_2
    iget-object v0, p1, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    invoke-virtual {v0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v0

    invoke-static {v0}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v0

    goto :goto_1

    .line 132
    :cond_3
    iget-object v1, p1, Lcom/vkontakte/android/UserProfile;->domain:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    move-result v1

    invoke-static {v1}, Ljava/lang/Character;->toLowerCase(C)C

    move-result v1

    goto :goto_2
.end method

.method public bridge synthetic getIndexChar(Ljava/lang/Object;)[C
    .locals 1

    .prologue
    .line 124
    check-cast p1, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/ui/MentionsAdapter$1;->getIndexChar(Lcom/vkontakte/android/UserProfile;)[C

    move-result-object v0

    return-object v0
.end method

.method public hasPriority()Z
    .locals 1

    .prologue
    .line 147
    const/4 v0, 0x1

    return v0
.end method

.method public matches(Ljava/lang/String;Lcom/vkontakte/android/UserProfile;)Z
    .locals 2
    .param p1, "q"    # Ljava/lang/String;
    .param p2, "item"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 138
    const-string/jumbo v0, "%empty%"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string/jumbo v0, "id"

    .line 139
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget v0, p2, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v0}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x2

    invoke-virtual {p1, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    iget-object v0, p2, Lcom/vkontakte/android/UserProfile;->firstName:Ljava/lang/String;

    .line 140
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p2, Lcom/vkontakte/android/UserProfile;->lastName:Ljava/lang/String;

    .line 141
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 142
    invoke-virtual {p2}, Lcom/vkontakte/android/UserProfile;->getHasRealDomain()Z

    move-result v0

    if-eqz v0, :cond_2

    iget-object v0, p2, Lcom/vkontakte/android/UserProfile;->domain:Ljava/lang/String;

    invoke-virtual {v0, p1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_2
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public bridge synthetic matches(Ljava/lang/String;Ljava/lang/Object;)Z
    .locals 1

    .prologue
    .line 124
    check-cast p2, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/ui/MentionsAdapter$1;->matches(Ljava/lang/String;Lcom/vkontakte/android/UserProfile;)Z

    move-result v0

    return v0
.end method

.method public priority(Ljava/lang/String;Lcom/vkontakte/android/UserProfile;)I
    .locals 3
    .param p1, "query"    # Ljava/lang/String;
    .param p2, "item"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 152
    iget-object v0, p0, Lcom/vkontakte/android/ui/MentionsAdapter$1;->this$0:Lcom/vkontakte/android/ui/MentionsAdapter;

    invoke-static {v0}, Lcom/vkontakte/android/ui/MentionsAdapter;->access$000(Lcom/vkontakte/android/ui/MentionsAdapter;)Landroid/util/SparseIntArray;

    move-result-object v0

    iget v1, p2, Lcom/vkontakte/android/UserProfile;->uid:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->get(II)I

    move-result v0

    return v0
.end method

.method public bridge synthetic priority(Ljava/lang/String;Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 124
    check-cast p2, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/ui/MentionsAdapter$1;->priority(Ljava/lang/String;Lcom/vkontakte/android/UserProfile;)I

    move-result v0

    return v0
.end method
