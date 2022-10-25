.class final Lcom/vkontakte/android/data/Friends$5;
.super Ljava/lang/Object;
.source "Friends.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/data/Friends;->createSections(Ljava/util/List;)Ljava/util/ArrayList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/vkontakte/android/UserProfile;",
        ">;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .locals 0

    .prologue
    .line 610
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/vkontakte/android/UserProfile;Lcom/vkontakte/android/UserProfile;)I
    .locals 2
    .param p1, "lhs"    # Lcom/vkontakte/android/UserProfile;
    .param p2, "rhs"    # Lcom/vkontakte/android/UserProfile;

    .prologue
    .line 613
    if-eqz p2, :cond_0

    if-nez p1, :cond_1

    .line 614
    :cond_0
    const/4 v0, 0x0

    .line 616
    :goto_0
    return v0

    :cond_1
    iget-object v0, p1, Lcom/vkontakte/android/UserProfile;->university:Ljava/lang/String;

    iget-object v1, p2, Lcom/vkontakte/android/UserProfile;->university:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v0

    goto :goto_0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 610
    check-cast p1, Lcom/vkontakte/android/UserProfile;

    check-cast p2, Lcom/vkontakte/android/UserProfile;

    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/data/Friends$5;->compare(Lcom/vkontakte/android/UserProfile;Lcom/vkontakte/android/UserProfile;)I

    move-result v0

    return v0
.end method
