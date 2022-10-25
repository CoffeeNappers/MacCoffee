.class public final Lcom/vk/sharing/target/Targets;
.super Ljava/lang/Object;
.source "Targets.java"

# interfaces
.implements Landroid/os/Parcelable;


# static fields
.field public static final CREATOR:Landroid/os/Parcelable$Creator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/os/Parcelable$Creator",
            "<",
            "Lcom/vk/sharing/target/Targets;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private dialogTargets:Ljava/util/ArrayList;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/sharing/target/Target;",
            ">;"
        }
    .end annotation
.end field

.field private full:Z

.field private groupTargets:Ljava/util/ArrayList;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/sharing/target/Target;",
            ">;"
        }
    .end annotation
.end field

.field private query:Ljava/lang/String;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private searchResultTargets:Ljava/util/ArrayList;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/sharing/target/Target;",
            ">;"
        }
    .end annotation
.end field

.field private final transient selection:Ljava/util/LinkedList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedList",
            "<",
            "Lcom/vk/sharing/target/Target;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 241
    new-instance v0, Lcom/vk/sharing/target/Targets$1;

    invoke-direct {v0}, Lcom/vk/sharing/target/Targets$1;-><init>()V

    sput-object v0, Lcom/vk/sharing/target/Targets;->CREATOR:Landroid/os/Parcelable$Creator;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    new-instance v0, Ljava/util/LinkedList;

    invoke-direct {v0}, Ljava/util/LinkedList;-><init>()V

    iput-object v0, p0, Lcom/vk/sharing/target/Targets;->selection:Ljava/util/LinkedList;

    .line 32
    const-string/jumbo v0, ""

    iput-object v0, p0, Lcom/vk/sharing/target/Targets;->query:Ljava/lang/String;

    .line 35
    return-void
.end method

.method private constructor <init>(Landroid/os/Parcel;)V
    .locals 5
    .param p1, "source"    # Landroid/os/Parcel;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v2, 0x1

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    new-instance v3, Ljava/util/LinkedList;

    invoke-direct {v3}, Ljava/util/LinkedList;-><init>()V

    iput-object v3, p0, Lcom/vk/sharing/target/Targets;->selection:Ljava/util/LinkedList;

    .line 32
    const-string/jumbo v3, ""

    iput-object v3, p0, Lcom/vk/sharing/target/Targets;->query:Ljava/lang/String;

    .line 38
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 39
    .local v0, "flag":I
    if-ne v0, v2, :cond_1

    .line 40
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3, v0}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v3, p0, Lcom/vk/sharing/target/Targets;->dialogTargets:Ljava/util/ArrayList;

    .line 41
    iget-object v3, p0, Lcom/vk/sharing/target/Targets;->dialogTargets:Ljava/util/ArrayList;

    sget-object v4, Lcom/vk/sharing/target/Target;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1, v3, v4}, Landroid/os/Parcel;->readTypedList(Ljava/util/List;Landroid/os/Parcelable$Creator;)V

    .line 42
    iget-object v3, p0, Lcom/vk/sharing/target/Targets;->dialogTargets:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_0
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/sharing/target/Target;

    .line 43
    .local v1, "target":Lcom/vk/sharing/target/Target;
    iget-boolean v4, v1, Lcom/vk/sharing/target/Target;->selected:Z

    if-eqz v4, :cond_0

    .line 44
    iget-object v4, p0, Lcom/vk/sharing/target/Targets;->selection:Ljava/util/LinkedList;

    invoke-virtual {v4, v1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 48
    .end local v1    # "target":Lcom/vk/sharing/target/Target;
    :cond_1
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 49
    if-ne v0, v2, :cond_2

    .line 50
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/vk/sharing/target/Targets;->groupTargets:Ljava/util/ArrayList;

    .line 51
    iget-object v3, p0, Lcom/vk/sharing/target/Targets;->groupTargets:Ljava/util/ArrayList;

    sget-object v4, Lcom/vk/sharing/target/Target;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1, v3, v4}, Landroid/os/Parcel;->readTypedList(Ljava/util/List;Landroid/os/Parcelable$Creator;)V

    .line 53
    :cond_2
    invoke-virtual {p1}, Landroid/os/Parcel;->readInt()I

    move-result v0

    .line 54
    if-ne v0, v2, :cond_3

    .line 55
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iput-object v3, p0, Lcom/vk/sharing/target/Targets;->searchResultTargets:Ljava/util/ArrayList;

    .line 56
    iget-object v3, p0, Lcom/vk/sharing/target/Targets;->searchResultTargets:Ljava/util/ArrayList;

    sget-object v4, Lcom/vk/sharing/target/Target;->CREATOR:Landroid/os/Parcelable$Creator;

    invoke-virtual {p1, v3, v4}, Landroid/os/Parcel;->readTypedList(Ljava/util/List;Landroid/os/Parcelable$Creator;)V

    .line 58
    :cond_3
    invoke-virtual {p1}, Landroid/os/Parcel;->readByte()B

    move-result v3

    if-ne v3, v2, :cond_4

    :goto_1
    iput-boolean v2, p0, Lcom/vk/sharing/target/Targets;->full:Z

    .line 59
    invoke-virtual {p1}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lcom/vk/sharing/target/Targets;->query:Ljava/lang/String;

    .line 60
    return-void

    .line 58
    :cond_4
    const/4 v2, 0x0

    goto :goto_1
.end method

.method synthetic constructor <init>(Landroid/os/Parcel;Lcom/vk/sharing/target/Targets$1;)V
    .locals 0
    .param p1, "x0"    # Landroid/os/Parcel;
    .param p2, "x1"    # Lcom/vk/sharing/target/Targets$1;

    .prologue
    .line 17
    invoke-direct {p0, p1}, Lcom/vk/sharing/target/Targets;-><init>(Landroid/os/Parcel;)V

    return-void
.end method


# virtual methods
.method public addTargetToDialogs(Lcom/vk/sharing/target/Target;)V
    .locals 2
    .param p1, "target"    # Lcom/vk/sharing/target/Target;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 108
    iget-object v0, p0, Lcom/vk/sharing/target/Targets;->dialogTargets:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 109
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/sharing/target/Targets;->dialogTargets:Ljava/util/ArrayList;

    .line 111
    :cond_0
    iget-object v0, p0, Lcom/vk/sharing/target/Targets;->dialogTargets:Ljava/util/ArrayList;

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    .line 112
    return-void
.end method

.method public addTargetsToDialogs(Ljava/util/ArrayList;)V
    .locals 1
    .param p1    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/sharing/target/Target;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 101
    .local p1, "targets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/sharing/target/Target;>;"
    iget-object v0, p0, Lcom/vk/sharing/target/Targets;->dialogTargets:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 102
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/sharing/target/Targets;->dialogTargets:Ljava/util/ArrayList;

    .line 104
    :cond_0
    iget-object v0, p0, Lcom/vk/sharing/target/Targets;->dialogTargets:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 105
    return-void
.end method

.method public addTargetsToGroups(Ljava/util/ArrayList;)V
    .locals 1
    .param p1    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/sharing/target/Target;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 120
    .local p1, "targets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/sharing/target/Target;>;"
    iget-object v0, p0, Lcom/vk/sharing/target/Targets;->groupTargets:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 121
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/sharing/target/Targets;->groupTargets:Ljava/util/ArrayList;

    .line 123
    :cond_0
    iget-object v0, p0, Lcom/vk/sharing/target/Targets;->groupTargets:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 124
    return-void
.end method

.method public clearSelection()V
    .locals 4

    .prologue
    const/4 v3, 0x0

    .line 187
    iget-object v1, p0, Lcom/vk/sharing/target/Targets;->dialogTargets:Ljava/util/ArrayList;

    if-eqz v1, :cond_0

    .line 188
    iget-object v1, p0, Lcom/vk/sharing/target/Targets;->dialogTargets:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/sharing/target/Target;

    .line 189
    .local v0, "target":Lcom/vk/sharing/target/Target;
    iput-boolean v3, v0, Lcom/vk/sharing/target/Target;->selected:Z

    goto :goto_0

    .line 192
    .end local v0    # "target":Lcom/vk/sharing/target/Target;
    :cond_0
    iget-object v1, p0, Lcom/vk/sharing/target/Targets;->groupTargets:Ljava/util/ArrayList;

    if-eqz v1, :cond_1

    .line 193
    iget-object v1, p0, Lcom/vk/sharing/target/Targets;->groupTargets:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/sharing/target/Target;

    .line 194
    .restart local v0    # "target":Lcom/vk/sharing/target/Target;
    iput-boolean v3, v0, Lcom/vk/sharing/target/Target;->selected:Z

    goto :goto_1

    .line 197
    .end local v0    # "target":Lcom/vk/sharing/target/Target;
    :cond_1
    iget-object v1, p0, Lcom/vk/sharing/target/Targets;->selection:Ljava/util/LinkedList;

    invoke-virtual {v1}, Ljava/util/LinkedList;->clear()V

    .line 198
    return-void
.end method

.method public containsTarget(Lcom/vk/sharing/target/Target;)Z
    .locals 1
    .param p1, "target"    # Lcom/vk/sharing/target/Target;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 127
    iget-object v0, p0, Lcom/vk/sharing/target/Targets;->dialogTargets:Ljava/util/ArrayList;

    if-nez v0, :cond_0

    .line 128
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/sharing/target/Targets;->dialogTargets:Ljava/util/ArrayList;

    .line 130
    :cond_0
    iget-object v0, p0, Lcom/vk/sharing/target/Targets;->dialogTargets:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public describeContents()I
    .locals 1

    .prologue
    .line 88
    const/4 v0, 0x0

    return v0
.end method

.method public getDialogTargets()Ljava/util/List;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vk/sharing/target/Target;",
            ">;"
        }
    .end annotation

    .prologue
    .line 97
    iget-object v0, p0, Lcom/vk/sharing/target/Targets;->dialogTargets:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/sharing/target/Targets;->dialogTargets:Ljava/util/ArrayList;

    :goto_0
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0

    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method public getDialogTargetsSize()I
    .locals 1

    .prologue
    .line 92
    iget-object v0, p0, Lcom/vk/sharing/target/Targets;->dialogTargets:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/sharing/target/Targets;->dialogTargets:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getGroupTargets()Ljava/util/List;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vk/sharing/target/Target;",
            ">;"
        }
    .end annotation

    .prologue
    .line 116
    iget-object v0, p0, Lcom/vk/sharing/target/Targets;->groupTargets:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/sharing/target/Targets;->groupTargets:Ljava/util/ArrayList;

    :goto_0
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0

    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method public getQuery()Ljava/lang/String;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 226
    iget-object v0, p0, Lcom/vk/sharing/target/Targets;->query:Ljava/lang/String;

    return-object v0
.end method

.method public getSearchResultTargets()Ljava/util/List;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vk/sharing/target/Target;",
            ">;"
        }
    .end annotation

    .prologue
    .line 202
    iget-object v0, p0, Lcom/vk/sharing/target/Targets;->searchResultTargets:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/vk/sharing/target/Targets;->searchResultTargets:Ljava/util/ArrayList;

    :goto_0
    return-object v0

    :cond_0
    invoke-static {}, Ljava/util/Collections;->emptyList()Ljava/util/List;

    move-result-object v0

    goto :goto_0
.end method

.method public getSelectedTargets()Ljava/util/List;
    .locals 1
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List",
            "<",
            "Lcom/vk/sharing/target/Target;",
            ">;"
        }
    .end annotation

    .prologue
    .line 135
    iget-object v0, p0, Lcom/vk/sharing/target/Targets;->selection:Ljava/util/LinkedList;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    return-object v0
.end method

.method public getSelectedTargetsSize()I
    .locals 1

    .prologue
    .line 139
    iget-object v0, p0, Lcom/vk/sharing/target/Targets;->selection:Ljava/util/LinkedList;

    invoke-virtual {v0}, Ljava/util/LinkedList;->size()I

    move-result v0

    return v0
.end method

.method public isDialogsLoaded()Z
    .locals 1

    .prologue
    .line 234
    iget-object v0, p0, Lcom/vk/sharing/target/Targets;->dialogTargets:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isFull()Z
    .locals 1

    .prologue
    .line 217
    iget-boolean v0, p0, Lcom/vk/sharing/target/Targets;->full:Z

    return v0
.end method

.method public isGroupsLoaded()Z
    .locals 1

    .prologue
    .line 238
    iget-object v0, p0, Lcom/vk/sharing/target/Targets;->groupTargets:Ljava/util/ArrayList;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public isTargetSelected(Lcom/vk/sharing/target/Target;)Z
    .locals 1
    .param p1, "target"    # Lcom/vk/sharing/target/Target;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 183
    iget-object v0, p0, Lcom/vk/sharing/target/Targets;->selection:Ljava/util/LinkedList;

    invoke-virtual {v0, p1}, Ljava/util/LinkedList;->contains(Ljava/lang/Object;)Z

    move-result v0

    return v0
.end method

.method public setFull(Z)V
    .locals 0
    .param p1, "full"    # Z

    .prologue
    .line 221
    iput-boolean p1, p0, Lcom/vk/sharing/target/Targets;->full:Z

    .line 222
    return-void
.end method

.method public setQuery(Ljava/lang/String;)V
    .locals 0
    .param p1, "query"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 230
    iput-object p1, p0, Lcom/vk/sharing/target/Targets;->query:Ljava/lang/String;

    .line 231
    return-void
.end method

.method public setSearchResultTargets(Ljava/util/ArrayList;)V
    .locals 3
    .param p1    # Ljava/util/ArrayList;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/sharing/target/Target;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 206
    .local p1, "targets":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vk/sharing/target/Target;>;"
    iput-object p1, p0, Lcom/vk/sharing/target/Targets;->searchResultTargets:Ljava/util/ArrayList;

    .line 207
    iget-object v1, p0, Lcom/vk/sharing/target/Targets;->searchResultTargets:Ljava/util/ArrayList;

    if-eqz v1, :cond_1

    .line 208
    iget-object v1, p0, Lcom/vk/sharing/target/Targets;->searchResultTargets:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_0
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/sharing/target/Target;

    .line 209
    .local v0, "target":Lcom/vk/sharing/target/Target;
    iget-object v2, p0, Lcom/vk/sharing/target/Targets;->selection:Ljava/util/LinkedList;

    invoke-virtual {v2, v0}, Ljava/util/LinkedList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 210
    const/4 v2, 0x1

    iput-boolean v2, v0, Lcom/vk/sharing/target/Target;->selected:Z

    goto :goto_0

    .line 214
    .end local v0    # "target":Lcom/vk/sharing/target/Target;
    :cond_1
    return-void
.end method

.method public toggleGroupSelection(Lcom/vk/sharing/target/Target;)Z
    .locals 4
    .param p1, "target"    # Lcom/vk/sharing/target/Target;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v1, 0x0

    .line 163
    iget-object v2, p0, Lcom/vk/sharing/target/Targets;->groupTargets:Ljava/util/ArrayList;

    if-nez v2, :cond_0

    .line 179
    :goto_0
    return v1

    .line 167
    :cond_0
    iget-object v2, p0, Lcom/vk/sharing/target/Targets;->groupTargets:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/sharing/target/Target;

    .line 168
    .local v0, "t":Lcom/vk/sharing/target/Target;
    invoke-virtual {p1, v0}, Lcom/vk/sharing/target/Target;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 169
    move-object p1, v0

    .line 173
    .end local v0    # "t":Lcom/vk/sharing/target/Target;
    :cond_2
    iget-boolean v2, p1, Lcom/vk/sharing/target/Target;->selected:Z

    if-nez v2, :cond_3

    const/4 v1, 0x1

    :cond_3
    iput-boolean v1, p1, Lcom/vk/sharing/target/Target;->selected:Z

    .line 174
    iget-boolean v1, p1, Lcom/vk/sharing/target/Target;->selected:Z

    if-eqz v1, :cond_4

    .line 175
    iget-object v1, p0, Lcom/vk/sharing/target/Targets;->selection:Ljava/util/LinkedList;

    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 179
    :goto_1
    iget-boolean v1, p1, Lcom/vk/sharing/target/Target;->selected:Z

    goto :goto_0

    .line 177
    :cond_4
    iget-object v1, p0, Lcom/vk/sharing/target/Targets;->selection:Ljava/util/LinkedList;

    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method public toggleSelection(Lcom/vk/sharing/target/Target;)Z
    .locals 4
    .param p1, "target"    # Lcom/vk/sharing/target/Target;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    const/4 v1, 0x0

    .line 143
    iget-object v2, p0, Lcom/vk/sharing/target/Targets;->dialogTargets:Ljava/util/ArrayList;

    if-nez v2, :cond_0

    .line 159
    :goto_0
    return v1

    .line 147
    :cond_0
    iget-object v2, p0, Lcom/vk/sharing/target/Targets;->dialogTargets:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vk/sharing/target/Target;

    .line 148
    .local v0, "t":Lcom/vk/sharing/target/Target;
    invoke-virtual {p1, v0}, Lcom/vk/sharing/target/Target;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 149
    move-object p1, v0

    .line 153
    .end local v0    # "t":Lcom/vk/sharing/target/Target;
    :cond_2
    iget-boolean v2, p1, Lcom/vk/sharing/target/Target;->selected:Z

    if-nez v2, :cond_3

    const/4 v1, 0x1

    :cond_3
    iput-boolean v1, p1, Lcom/vk/sharing/target/Target;->selected:Z

    .line 154
    iget-boolean v1, p1, Lcom/vk/sharing/target/Target;->selected:Z

    if-eqz v1, :cond_4

    .line 155
    iget-object v1, p0, Lcom/vk/sharing/target/Targets;->selection:Ljava/util/LinkedList;

    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->add(Ljava/lang/Object;)Z

    .line 159
    :goto_1
    iget-boolean v1, p1, Lcom/vk/sharing/target/Target;->selected:Z

    goto :goto_0

    .line 157
    :cond_4
    iget-object v1, p0, Lcom/vk/sharing/target/Targets;->selection:Ljava/util/LinkedList;

    invoke-virtual {v1, p1}, Ljava/util/LinkedList;->remove(Ljava/lang/Object;)Z

    goto :goto_1
.end method

.method public writeToParcel(Landroid/os/Parcel;I)V
    .locals 3
    .param p1, "dest"    # Landroid/os/Parcel;
    .param p2, "flags"    # I

    .prologue
    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 64
    iget-object v2, p0, Lcom/vk/sharing/target/Targets;->dialogTargets:Ljava/util/ArrayList;

    if-eqz v2, :cond_0

    .line 65
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 66
    iget-object v2, p0, Lcom/vk/sharing/target/Targets;->dialogTargets:Ljava/util/ArrayList;

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 70
    :goto_0
    iget-object v2, p0, Lcom/vk/sharing/target/Targets;->groupTargets:Ljava/util/ArrayList;

    if-eqz v2, :cond_1

    .line 71
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 72
    iget-object v2, p0, Lcom/vk/sharing/target/Targets;->groupTargets:Ljava/util/ArrayList;

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 76
    :goto_1
    iget-object v2, p0, Lcom/vk/sharing/target/Targets;->searchResultTargets:Ljava/util/ArrayList;

    if-eqz v2, :cond_2

    .line 77
    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeInt(I)V

    .line 78
    iget-object v2, p0, Lcom/vk/sharing/target/Targets;->searchResultTargets:Ljava/util/ArrayList;

    invoke-virtual {p1, v2}, Landroid/os/Parcel;->writeTypedList(Ljava/util/List;)V

    .line 82
    :goto_2
    iget-boolean v2, p0, Lcom/vk/sharing/target/Targets;->full:Z

    if-eqz v2, :cond_3

    :goto_3
    int-to-byte v0, v0

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeByte(B)V

    .line 83
    iget-object v0, p0, Lcom/vk/sharing/target/Targets;->query:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroid/os/Parcel;->writeString(Ljava/lang/String;)V

    .line 84
    return-void

    .line 68
    :cond_0
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_0

    .line 74
    :cond_1
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_1

    .line 80
    :cond_2
    invoke-virtual {p1, v1}, Landroid/os/Parcel;->writeInt(I)V

    goto :goto_2

    :cond_3
    move v0, v1

    .line 82
    goto :goto_3
.end method
