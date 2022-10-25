.class public final Lcom/vk/music/model/SearchSuggestionModelImpl;
.super Lcom/vk/music/model/ObservableModel;
.source "SearchSuggestionModelImpl.java"

# interfaces
.implements Lcom/vk/music/model/SearchSuggestionModel;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vk/music/model/ObservableModel",
        "<",
        "Lcom/vk/music/model/SearchSuggestionModel$Callback;",
        ">;",
        "Lcom/vk/music/model/SearchSuggestionModel;"
    }
.end annotation


# static fields
.field private static final MAX_POPULAR:I = 0x14

.field private static final MAX_RECENTS:I = 0x5


# instance fields
.field private hints:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private loadHintsRequest:Lcom/vkontakte/android/api/VKAPIRequest;

.field private loadPopularRequest:Lcom/vkontakte/android/api/VKAPIRequest;

.field private popular:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final preferences:Landroid/content/SharedPreferences;

.field private recents:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/SharedPreferences;)V
    .locals 1
    .param p1, "preferences"    # Landroid/content/SharedPreferences;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v0, 0x0

    .line 37
    invoke-direct {p0}, Lcom/vk/music/model/ObservableModel;-><init>()V

    .line 34
    iput-object v0, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->loadPopularRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 35
    iput-object v0, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->loadHintsRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    .line 38
    iput-object p1, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->preferences:Landroid/content/SharedPreferences;

    .line 39
    return-void
.end method

.method static synthetic access$002(Lcom/vk/music/model/SearchSuggestionModelImpl;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/model/SearchSuggestionModelImpl;
    .param p1, "x1"    # Lcom/vkontakte/android/api/VKAPIRequest;

    .prologue
    .line 23
    iput-object p1, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->loadPopularRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    return-object p1
.end method

.method static synthetic access$102(Lcom/vk/music/model/SearchSuggestionModelImpl;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/model/SearchSuggestionModelImpl;
    .param p1, "x1"    # Ljava/util/ArrayList;

    .prologue
    .line 23
    iput-object p1, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->popular:Ljava/util/ArrayList;

    return-object p1
.end method

.method static synthetic access$202(Lcom/vk/music/model/SearchSuggestionModelImpl;Lcom/vkontakte/android/api/VKAPIRequest;)Lcom/vkontakte/android/api/VKAPIRequest;
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/model/SearchSuggestionModelImpl;
    .param p1, "x1"    # Lcom/vkontakte/android/api/VKAPIRequest;

    .prologue
    .line 23
    iput-object p1, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->loadHintsRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    return-object p1
.end method

.method static synthetic access$302(Lcom/vk/music/model/SearchSuggestionModelImpl;Ljava/util/ArrayList;)Ljava/util/ArrayList;
    .locals 0
    .param p0, "x0"    # Lcom/vk/music/model/SearchSuggestionModelImpl;
    .param p1, "x1"    # Ljava/util/ArrayList;

    .prologue
    .line 23
    iput-object p1, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->hints:Ljava/util/ArrayList;

    return-object p1
.end method

.method private loadRecents()V
    .locals 5

    .prologue
    .line 52
    new-instance v2, Ljava/util/LinkedList;

    invoke-direct {v2}, Ljava/util/LinkedList;-><init>()V

    iput-object v2, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->recents:Ljava/util/LinkedList;

    .line 54
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    const/4 v2, 0x5

    if-ge v0, v2, :cond_0

    .line 55
    iget-object v2, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->preferences:Landroid/content/SharedPreferences;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v4, "rec"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 56
    .local v1, "val":Ljava/lang/String;
    if-eqz v1, :cond_0

    .line 57
    iget-object v2, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->recents:Ljava/util/LinkedList;

    invoke-virtual {v2, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 54
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    .line 62
    .end local v1    # "val":Ljava/lang/String;
    :cond_0
    return-void
.end method

.method private saveRecentsToPreferences()V
    .locals 7

    .prologue
    .line 86
    iget-object v4, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v4}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 87
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    const/4 v1, 0x0

    .line 88
    .local v1, "i":I
    iget-object v4, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->recents:Ljava/util/LinkedList;

    invoke-virtual {v4}, Ljava/util/LinkedList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_0
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    .line 89
    .local v3, "recent":Ljava/lang/String;
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v6, "rec"

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    add-int/lit8 v2, v1, 0x1

    .end local v1    # "i":I
    .local v2, "i":I
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v0, v5, v3}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move v1, v2

    .line 90
    .end local v2    # "i":I
    .restart local v1    # "i":I
    goto :goto_0

    .line 91
    .end local v3    # "recent":Ljava/lang/String;
    :cond_0
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 92
    return-void
.end method


# virtual methods
.method public addRecent(Ljava/lang/String;)V
    .locals 3
    .param p1, "recent"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 66
    iget-object v1, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->recents:Ljava/util/LinkedList;

    if-nez v1, :cond_0

    .line 67
    invoke-direct {p0}, Lcom/vk/music/model/SearchSuggestionModelImpl;->loadRecents()V

    .line 70
    :cond_0
    iget-object v1, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->recents:Ljava/util/LinkedList;

    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->indexOf(Ljava/lang/Object;)I

    move-result v0

    .line 71
    .local v0, "index":I
    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    .line 72
    iget-object v1, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->recents:Ljava/util/LinkedList;

    iget-object v2, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->recents:Ljava/util/LinkedList;

    invoke-virtual {v2, v0}, Ljava/util/LinkedList;->remove(I)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/util/LinkedList;->push(Ljava/lang/Object;)V

    .line 80
    :goto_0
    invoke-direct {p0}, Lcom/vk/music/model/SearchSuggestionModelImpl;->saveRecentsToPreferences()V

    .line 82
    invoke-static {p0}, Lcom/vk/music/model/SearchSuggestionModelImpl$$Lambda$1;->lambdaFactory$(Lcom/vk/music/model/SearchSuggestionModelImpl;)Lcom/vk/music/model/ObservableModel$Notification;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/vk/music/model/SearchSuggestionModelImpl;->notifyObservers(Lcom/vk/music/model/ObservableModel$Notification;)V

    .line 83
    return-void

    .line 74
    :cond_1
    iget-object v1, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->recents:Ljava/util/LinkedList;

    invoke-static {v1}, Lcom/vk/core/util/CollectionUtils;->count(Ljava/util/Collection;)I

    move-result v1

    const/4 v2, 0x5

    if-ne v1, v2, :cond_2

    .line 75
    iget-object v1, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->recents:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->pollLast()Ljava/lang/Object;

    .line 77
    :cond_2
    iget-object v1, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->recents:Ljava/util/LinkedList;

    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->push(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public clearRecents()V
    .locals 1

    .prologue
    .line 96
    iget-object v0, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->recents:Ljava/util/LinkedList;

    if-eqz v0, :cond_0

    .line 97
    iget-object v0, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->recents:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->clear()V

    .line 99
    :cond_0
    iget-object v0, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->clear()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 100
    return-void
.end method

.method public getHints()Ljava/util/List;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 111
    iget-object v0, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->hints:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getPopular()Ljava/util/List;
    .locals 1
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 105
    iget-object v0, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->popular:Ljava/util/ArrayList;

    return-object v0
.end method

.method public getRecents()Ljava/util/List;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 44
    iget-object v0, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->recents:Ljava/util/LinkedList;

    if-nez v0, :cond_0

    .line 45
    invoke-direct {p0}, Lcom/vk/music/model/SearchSuggestionModelImpl;->loadRecents()V

    .line 48
    :cond_0
    iget-object v0, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->recents:Ljava/util/LinkedList;

    return-object v0
.end method

.method synthetic lambda$addRecent$0(Lcom/vk/music/model/SearchSuggestionModel$Callback;)V
    .locals 0
    .param p1, "callback"    # Lcom/vk/music/model/SearchSuggestionModel$Callback;

    .prologue
    .line 82
    invoke-interface {p1, p0}, Lcom/vk/music/model/SearchSuggestionModel$Callback;->onRecentsChanged(Lcom/vk/music/model/SearchSuggestionModel;)V

    return-void
.end method

.method public loadHints(Ljava/lang/String;)V
    .locals 2
    .param p1, "query"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 141
    iget-object v0, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->loadHintsRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_0

    .line 162
    :goto_0
    return-void

    .line 145
    :cond_0
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioGetHints;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/api/audio/AudioGetHints;-><init>(Ljava/lang/String;)V

    new-instance v1, Lcom/vk/music/model/SearchSuggestionModelImpl$2;

    invoke-direct {v1, p0}, Lcom/vk/music/model/SearchSuggestionModelImpl$2;-><init>(Lcom/vk/music/model/SearchSuggestionModelImpl;)V

    .line 146
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/audio/AudioGetHints;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 161
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Ljava/lang/Object;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->loadHintsRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method public loadPopular()V
    .locals 2

    .prologue
    .line 116
    iget-object v0, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->loadPopularRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_0

    .line 137
    :goto_0
    return-void

    .line 120
    :cond_0
    new-instance v0, Lcom/vkontakte/android/api/audio/AudioGetSearchTrends;

    const/16 v1, 0x14

    invoke-direct {v0, v1}, Lcom/vkontakte/android/api/audio/AudioGetSearchTrends;-><init>(I)V

    new-instance v1, Lcom/vk/music/model/SearchSuggestionModelImpl$1;

    invoke-direct {v1, p0}, Lcom/vk/music/model/SearchSuggestionModelImpl$1;-><init>(Lcom/vk/music/model/SearchSuggestionModelImpl;)V

    .line 121
    invoke-virtual {v0, v1}, Lcom/vkontakte/android/api/audio/AudioGetSearchTrends;->setCallback(Lcom/vkontakte/android/api/Callback;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    .line 136
    invoke-virtual {v0, p0}, Lcom/vkontakte/android/api/VKAPIRequest;->exec(Ljava/lang/Object;)Lcom/vkontakte/android/api/VKAPIRequest;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->loadPopularRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    goto :goto_0
.end method

.method public release()V
    .locals 1

    .prologue
    .line 181
    iget-object v0, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->loadPopularRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_0

    .line 182
    iget-object v0, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->loadPopularRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->cancel()V

    .line 184
    :cond_0
    iget-object v0, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->loadHintsRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    if-eqz v0, :cond_1

    .line 185
    iget-object v0, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->loadHintsRequest:Lcom/vkontakte/android/api/VKAPIRequest;

    invoke-virtual {v0}, Lcom/vkontakte/android/api/VKAPIRequest;->cancel()V

    .line 187
    :cond_1
    return-void
.end method

.method public restore(Landroid/os/Bundle;)V
    .locals 1
    .param p1, "state"    # Landroid/os/Bundle;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 166
    const-string/jumbo v0, "popular"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->popular:Ljava/util/ArrayList;

    .line 167
    const-string/jumbo v0, "hints"

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getStringArrayList(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->hints:Ljava/util/ArrayList;

    .line 168
    return-void
.end method

.method public save()Landroid/os/Bundle;
    .locals 3
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 173
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 174
    .local v0, "state":Landroid/os/Bundle;
    const-string/jumbo v1, "popular"

    iget-object v2, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->popular:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 175
    const-string/jumbo v1, "hints"

    iget-object v2, p0, Lcom/vk/music/model/SearchSuggestionModelImpl;->hints:Ljava/util/ArrayList;

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putStringArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 176
    return-object v0
.end method

.method public bridge synthetic subscribe(Lcom/vk/music/model/SearchSuggestionModel$Callback;)V
    .locals 0
    .param p1    # Lcom/vk/music/model/SearchSuggestionModel$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 23
    invoke-super {p0, p1}, Lcom/vk/music/model/ObservableModel;->subscribe(Ljava/lang/Object;)V

    return-void
.end method

.method public bridge synthetic unsubscribe(Lcom/vk/music/model/SearchSuggestionModel$Callback;)V
    .locals 0
    .param p1    # Lcom/vk/music/model/SearchSuggestionModel$Callback;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 23
    invoke-super {p0, p1}, Lcom/vk/music/model/ObservableModel;->unsubscribe(Ljava/lang/Object;)V

    return-void
.end method
