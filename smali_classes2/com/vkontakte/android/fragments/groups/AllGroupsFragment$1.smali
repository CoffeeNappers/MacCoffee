.class Lcom/vkontakte/android/fragments/groups/AllGroupsFragment$1;
.super Lcom/vkontakte/android/fragments/friends/SearchIndexer$SimpleProvider;
.source "AllGroupsFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/fragments/friends/SearchIndexer$SimpleProvider",
        "<",
        "Lcom/vkontakte/android/api/Group;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;

    .prologue
    .line 34
    iput-object p1, p0, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment$1;->this$0:Lcom/vkontakte/android/fragments/groups/AllGroupsFragment;

    invoke-direct {p0}, Lcom/vkontakte/android/fragments/friends/SearchIndexer$SimpleProvider;-><init>()V

    return-void
.end method


# virtual methods
.method public getIndexChar(Lcom/vkontakte/android/api/Group;)[C
    .locals 2
    .param p1, "from"    # Lcom/vkontakte/android/api/Group;

    .prologue
    const/4 v1, 0x0

    .line 38
    if-eqz p1, :cond_0

    .line 39
    invoke-virtual {p1}, Lcom/vkontakte/android/api/Group;->getIndexChars()[C

    move-result-object v0

    .line 41
    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x1

    new-array v0, v0, [C

    aput-char v1, v0, v1

    goto :goto_0
.end method

.method public bridge synthetic getIndexChar(Ljava/lang/Object;)[C
    .locals 1

    .prologue
    .line 34
    check-cast p1, Lcom/vkontakte/android/api/Group;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment$1;->getIndexChar(Lcom/vkontakte/android/api/Group;)[C

    move-result-object v0

    return-object v0
.end method

.method public matches(Ljava/lang/String;Lcom/vkontakte/android/api/Group;)Z
    .locals 1
    .param p1, "q"    # Ljava/lang/String;
    .param p2, "item"    # Lcom/vkontakte/android/api/Group;

    .prologue
    .line 47
    invoke-virtual {p2, p1}, Lcom/vkontakte/android/api/Group;->matches(Ljava/lang/String;)Z

    move-result v0

    return v0
.end method

.method public bridge synthetic matches(Ljava/lang/String;Ljava/lang/Object;)Z
    .locals 1

    .prologue
    .line 34
    check-cast p2, Lcom/vkontakte/android/api/Group;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/groups/AllGroupsFragment$1;->matches(Ljava/lang/String;Lcom/vkontakte/android/api/Group;)Z

    move-result v0

    return v0
.end method
