.class final Lcom/vkontakte/android/data/Friends$4;
.super Ljava/lang/Object;
.source "Friends.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/data/Friends;->getImportedContacts(ILcom/vkontakte/android/data/Friends$GetImportedContactsCallback;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = null
.end annotation


# instance fields
.field final synthetic val$callback:Lcom/vkontakte/android/data/Friends$GetImportedContactsCallback;

.field final synthetic val$service:I


# direct methods
.method constructor <init>(ILcom/vkontakte/android/data/Friends$GetImportedContactsCallback;)V
    .locals 0

    .prologue
    .line 493
    iput p1, p0, Lcom/vkontakte/android/data/Friends$4;->val$service:I

    iput-object p2, p0, Lcom/vkontakte/android/data/Friends$4;->val$callback:Lcom/vkontakte/android/data/Friends$GetImportedContactsCallback;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public run()V
    .locals 11

    .prologue
    .line 495
    iget v8, p0, Lcom/vkontakte/android/data/Friends$4;->val$service:I

    invoke-static {v8}, Lcom/vkontakte/android/cache/Cache;->getImportedContacts(I)Ljava/util/ArrayList;

    move-result-object v7

    .line 496
    .local v7, "users":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 498
    .local v0, "descs":Landroid/util/SparseArray;, "Landroid/util/SparseArray<Ljava/lang/String;>;"
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 499
    .local v2, "needProfiles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_0
    :goto_0
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_1

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lcom/vkontakte/android/UserProfile;

    .line 500
    .local v6, "u":Lcom/vkontakte/android/UserProfile;
    iget v9, v6, Lcom/vkontakte/android/UserProfile;->uid:I

    if-lez v9, :cond_0

    .line 501
    iget v9, v6, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v2, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 502
    iget v9, v6, Lcom/vkontakte/android/UserProfile;->uid:I

    iget-object v10, v6, Lcom/vkontakte/android/UserProfile;->university:Ljava/lang/String;

    invoke-virtual {v0, v9, v10}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_0

    .line 506
    .end local v6    # "u":Lcom/vkontakte/android/UserProfile;
    :cond_1
    const/4 v8, 0x1

    invoke-static {v2, v8}, Lcom/vkontakte/android/cache/Cache;->getUsers(Ljava/util/List;Z)Ljava/util/ArrayList;

    move-result-object v5

    .line 507
    .local v5, "profiles":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/UserProfile;>;"
    invoke-virtual {v5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :goto_1
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/UserProfile;

    .line 508
    .local v4, "profile":Lcom/vkontakte/android/UserProfile;
    iget v8, v4, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v0, v8}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/String;

    iput-object v8, v4, Lcom/vkontakte/android/UserProfile;->university:Ljava/lang/String;

    goto :goto_1

    .line 510
    .end local v4    # "profile":Lcom/vkontakte/android/UserProfile;
    :cond_2
    invoke-virtual {v7}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    .line 511
    .local v1, "itr":Ljava/util/Iterator;, "Ljava/util/Iterator<Lcom/vkontakte/android/UserProfile;>;"
    :cond_3
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_4

    .line 512
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/vkontakte/android/UserProfile;

    .line 513
    .local v3, "p":Lcom/vkontakte/android/UserProfile;
    iget v8, v3, Lcom/vkontakte/android/UserProfile;->uid:I

    if-lez v8, :cond_3

    .line 514
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    goto :goto_2

    .line 517
    .end local v3    # "p":Lcom/vkontakte/android/UserProfile;
    :cond_4
    iget-object v8, p0, Lcom/vkontakte/android/data/Friends$4;->val$callback:Lcom/vkontakte/android/data/Friends$GetImportedContactsCallback;

    invoke-interface {v8, v5, v7}, Lcom/vkontakte/android/data/Friends$GetImportedContactsCallback;->onUsersLoaded(Ljava/util/ArrayList;Ljava/util/ArrayList;)V

    .line 518
    return-void
.end method
