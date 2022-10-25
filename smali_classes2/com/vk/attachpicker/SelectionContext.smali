.class public Lcom/vk/attachpicker/SelectionContext;
.super Ljava/lang/Object;
.source "SelectionContext.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/attachpicker/SelectionContext$SelectionContextProvider;,
        Lcom/vk/attachpicker/SelectionContext$SelectionCallback;
    }
.end annotation


# static fields
.field public static final globalCheckLock:Lcom/vk/core/util/TimeoutLock;


# instance fields
.field private final currentSelection:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vk/attachpicker/mediastore/MediaStoreEntry;",
            ">;"
        }
    .end annotation
.end field

.field private limit:I

.field private requestCode:I

.field private selectionCallback:Lcom/vk/attachpicker/SelectionContext$SelectionCallback;
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .prologue
    .line 83
    new-instance v0, Lcom/vk/core/util/TimeoutLock;

    const-wide/16 v2, 0x46

    invoke-direct {v0, v2, v3}, Lcom/vk/core/util/TimeoutLock;-><init>(J)V

    sput-object v0, Lcom/vk/attachpicker/SelectionContext;->globalCheckLock:Lcom/vk/core/util/TimeoutLock;

    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .prologue
    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 85
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vk/attachpicker/SelectionContext;->currentSelection:Ljava/util/ArrayList;

    .line 88
    const/16 v0, 0xa

    iput v0, p0, Lcom/vk/attachpicker/SelectionContext;->limit:I

    return-void
.end method

.method private onSelectionChange()V
    .locals 2

    .prologue
    .line 182
    invoke-static {}, Lcom/vk/attachpicker/events/NotificationCenter;->getInstance()Lcom/vk/attachpicker/events/NotificationCenter;

    move-result-object v0

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/vk/attachpicker/events/NotificationCenter;->fireEvent(I)V

    .line 183
    iget-object v0, p0, Lcom/vk/attachpicker/SelectionContext;->selectionCallback:Lcom/vk/attachpicker/SelectionContext$SelectionCallback;

    if-eqz v0, :cond_0

    .line 184
    iget-object v0, p0, Lcom/vk/attachpicker/SelectionContext;->selectionCallback:Lcom/vk/attachpicker/SelectionContext$SelectionCallback;

    invoke-virtual {p0}, Lcom/vk/attachpicker/SelectionContext;->selectionCount()I

    move-result v1

    invoke-interface {v0, v1}, Lcom/vk/attachpicker/SelectionContext$SelectionCallback;->onSelect(I)V

    .line 186
    :cond_0
    return-void
.end method

.method public static packSelection(Landroid/os/Bundle;)Landroid/content/Intent;
    .locals 2
    .param p0, "b"    # Landroid/os/Bundle;

    .prologue
    .line 78
    new-instance v0, Landroid/content/Intent;

    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 79
    .local v0, "intent":Landroid/content/Intent;
    const-string/jumbo v1, "result_attachments"

    invoke-virtual {v0, v1, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Landroid/os/Bundle;)Landroid/content/Intent;

    .line 80
    return-object v0
.end method

.method public static packSingleEntry(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)Landroid/content/Intent;
    .locals 6
    .param p0, "e"    # Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .prologue
    const/4 v4, 0x1

    .line 32
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 33
    .local v1, "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/net/Uri;>;"
    new-array v3, v4, [Z

    .line 35
    .local v3, "videoFlags":[Z
    iget-object v4, p0, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;->path:Landroid/net/Uri;

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 36
    const/4 v4, 0x0

    iget-boolean v5, p0, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;->isVideo:Z

    aput-boolean v5, v3, v4

    .line 38
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 39
    .local v0, "bundle":Landroid/os/Bundle;
    const-string/jumbo v4, "result_files"

    invoke-virtual {v0, v4, v1}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 40
    const-string/jumbo v4, "result_video_flags"

    invoke-virtual {v0, v4, v3}, Landroid/os/Bundle;->putBooleanArray(Ljava/lang/String;[Z)V

    .line 42
    invoke-static {v0}, Lcom/vk/attachpicker/SelectionContext;->packSelection(Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object v2

    .line 43
    .local v2, "intent":Landroid/content/Intent;
    iget-object v4, p0, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;->path:Landroid/net/Uri;

    invoke-virtual {v2, v4}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 44
    return-object v2
.end method

.method public static packSinglePhoto(Ljava/io/File;)Landroid/content/Intent;
    .locals 5
    .param p0, "file"    # Ljava/io/File;

    .prologue
    const/4 v3, 0x1

    const/4 v4, 0x0

    .line 48
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v3}, Ljava/util/ArrayList;-><init>(I)V

    .line 49
    .local v1, "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/net/Uri;>;"
    new-array v2, v3, [Z

    .line 51
    .local v2, "videoFlags":[Z
    invoke-static {p0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 52
    aput-boolean v4, v2, v4

    .line 54
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 55
    .local v0, "bundle":Landroid/os/Bundle;
    const-string/jumbo v3, "result_files"

    invoke-virtual {v0, v3, v1}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 56
    const-string/jumbo v3, "result_video_flags"

    invoke-virtual {v0, v3, v2}, Landroid/os/Bundle;->putBooleanArray(Ljava/lang/String;[Z)V

    .line 58
    invoke-static {v0}, Lcom/vk/attachpicker/SelectionContext;->packSelection(Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object v3

    return-object v3
.end method

.method public static packSingleVideo(Landroid/net/Uri;)Landroid/content/Intent;
    .locals 6
    .param p0, "file"    # Landroid/net/Uri;

    .prologue
    const/4 v5, 0x1

    .line 62
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 63
    .local v1, "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/net/Uri;>;"
    new-array v3, v5, [Z

    .line 65
    .local v3, "videoFlags":[Z
    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 66
    const/4 v4, 0x0

    aput-boolean v5, v3, v4

    .line 68
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 69
    .local v0, "bundle":Landroid/os/Bundle;
    const-string/jumbo v4, "result_files"

    invoke-virtual {v0, v4, v1}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 70
    const-string/jumbo v4, "result_video_flags"

    invoke-virtual {v0, v4, v3}, Landroid/os/Bundle;->putBooleanArray(Ljava/lang/String;[Z)V

    .line 72
    invoke-static {v0}, Lcom/vk/attachpicker/SelectionContext;->packSelection(Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object v2

    .line 73
    .local v2, "intent":Landroid/content/Intent;
    invoke-virtual {v2, p0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 74
    return-object v2
.end method


# virtual methods
.method public addSelection(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)I
    .locals 2
    .param p1, "entry"    # Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .prologue
    .line 158
    iget-object v0, p0, Lcom/vk/attachpicker/SelectionContext;->currentSelection:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget v1, p0, Lcom/vk/attachpicker/SelectionContext;->limit:I

    if-eq v0, v1, :cond_0

    invoke-virtual {p0, p1}, Lcom/vk/attachpicker/SelectionContext;->isSelected(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 159
    :cond_0
    invoke-virtual {p0, p1}, Lcom/vk/attachpicker/SelectionContext;->findSelectionPosition(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)I

    move-result v0

    .line 163
    :goto_0
    return v0

    .line 161
    :cond_1
    iget-object v0, p0, Lcom/vk/attachpicker/SelectionContext;->currentSelection:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 162
    invoke-direct {p0}, Lcom/vk/attachpicker/SelectionContext;->onSelectionChange()V

    .line 163
    iget-object v0, p0, Lcom/vk/attachpicker/SelectionContext;->currentSelection:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    goto :goto_0
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 177
    iget-object v0, p0, Lcom/vk/attachpicker/SelectionContext;->currentSelection:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 178
    invoke-direct {p0}, Lcom/vk/attachpicker/SelectionContext;->onSelectionChange()V

    .line 179
    return-void
.end method

.method public findSelectionPosition(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)I
    .locals 3
    .param p1, "entry"    # Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .prologue
    .line 147
    const/4 v1, -0x1

    .line 148
    .local v1, "pos":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/vk/attachpicker/SelectionContext;->currentSelection:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 149
    iget-object v2, p0, Lcom/vk/attachpicker/SelectionContext;->currentSelection:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    invoke-virtual {v2, p1}, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 150
    move v1, v0

    .line 154
    :cond_0
    return v1

    .line 148
    :cond_1
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public getLimit()I
    .locals 1

    .prologue
    .line 128
    iget v0, p0, Lcom/vk/attachpicker/SelectionContext;->limit:I

    return v0
.end method

.method public getPackedSelection()Landroid/content/Intent;
    .locals 1

    .prologue
    .line 91
    invoke-virtual {p0}, Lcom/vk/attachpicker/SelectionContext;->getSelection()Landroid/os/Bundle;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/attachpicker/SelectionContext;->packSelection(Landroid/os/Bundle;)Landroid/content/Intent;

    move-result-object v0

    return-object v0
.end method

.method public getRequestCode()I
    .locals 1

    .prologue
    .line 120
    iget v0, p0, Lcom/vk/attachpicker/SelectionContext;->requestCode:I

    return v0
.end method

.method public getSelection()Landroid/os/Bundle;
    .locals 6

    .prologue
    .line 95
    new-instance v2, Ljava/util/ArrayList;

    iget-object v5, p0, Lcom/vk/attachpicker/SelectionContext;->currentSelection:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    invoke-direct {v2, v5}, Ljava/util/ArrayList;-><init>(I)V

    .line 96
    .local v2, "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/net/Uri;>;"
    iget-object v5, p0, Lcom/vk/attachpicker/SelectionContext;->currentSelection:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    new-array v4, v5, [Z

    .line 98
    .local v4, "videoFlags":[Z
    const/4 v3, 0x0

    .local v3, "i":I
    :goto_0
    array-length v5, v4

    if-ge v3, v5, :cond_0

    .line 99
    iget-object v5, p0, Lcom/vk/attachpicker/SelectionContext;->currentSelection:Ljava/util/ArrayList;

    invoke-virtual {v5, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .line 100
    .local v1, "e":Lcom/vk/attachpicker/mediastore/MediaStoreEntry;
    iget-object v5, v1, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;->path:Landroid/net/Uri;

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 101
    iget-boolean v5, v1, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;->isVideo:Z

    aput-boolean v5, v4, v3

    .line 98
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 104
    .end local v1    # "e":Lcom/vk/attachpicker/mediastore/MediaStoreEntry;
    :cond_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 105
    .local v0, "bundle":Landroid/os/Bundle;
    const-string/jumbo v5, "result_files"

    invoke-virtual {v0, v5, v2}, Landroid/os/Bundle;->putParcelableArrayList(Ljava/lang/String;Ljava/util/ArrayList;)V

    .line 106
    const-string/jumbo v5, "result_video_flags"

    invoke-virtual {v0, v5, v4}, Landroid/os/Bundle;->putBooleanArray(Ljava/lang/String;[Z)V

    .line 108
    return-object v0
.end method

.method public getSelectionPaths()Ljava/util/ArrayList;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList",
            "<",
            "Landroid/net/Uri;",
            ">;"
        }
    .end annotation

    .prologue
    .line 112
    new-instance v0, Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/vk/attachpicker/SelectionContext;->currentSelection:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 113
    .local v0, "files":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/net/Uri;>;"
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    iget-object v2, p0, Lcom/vk/attachpicker/SelectionContext;->currentSelection:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v1, v2, :cond_0

    .line 114
    iget-object v2, p0, Lcom/vk/attachpicker/SelectionContext;->currentSelection:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    iget-object v2, v2, Lcom/vk/attachpicker/mediastore/MediaStoreEntry;->path:Landroid/net/Uri;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 113
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 116
    :cond_0
    return-object v0
.end method

.method public isSelected(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)Z
    .locals 1
    .param p1, "entry"    # Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .prologue
    .line 140
    if-nez p1, :cond_0

    .line 141
    const/4 v0, 0x0

    .line 143
    :goto_0
    return v0

    :cond_0
    iget-object v0, p0, Lcom/vk/attachpicker/SelectionContext;->currentSelection:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    goto :goto_0
.end method

.method public removeSelection(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)Z
    .locals 1
    .param p1, "entry"    # Lcom/vk/attachpicker/mediastore/MediaStoreEntry;

    .prologue
    .line 167
    invoke-virtual {p0, p1}, Lcom/vk/attachpicker/SelectionContext;->isSelected(Lcom/vk/attachpicker/mediastore/MediaStoreEntry;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 168
    iget-object v0, p0, Lcom/vk/attachpicker/SelectionContext;->currentSelection:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    .line 169
    invoke-direct {p0}, Lcom/vk/attachpicker/SelectionContext;->onSelectionChange()V

    .line 170
    const/4 v0, 0x1

    .line 172
    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public selectionCount()I
    .locals 1

    .prologue
    .line 136
    iget-object v0, p0, Lcom/vk/attachpicker/SelectionContext;->currentSelection:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0
.end method

.method public setLimit(I)V
    .locals 0
    .param p1, "limit"    # I

    .prologue
    .line 132
    iput p1, p0, Lcom/vk/attachpicker/SelectionContext;->limit:I

    .line 133
    return-void
.end method

.method public setRequestCode(I)V
    .locals 0
    .param p1, "requestCode"    # I

    .prologue
    .line 124
    iput p1, p0, Lcom/vk/attachpicker/SelectionContext;->requestCode:I

    .line 125
    return-void
.end method

.method public setSelectListener(Lcom/vk/attachpicker/SelectionContext$SelectionCallback;)V
    .locals 0
    .param p1, "selectListener"    # Lcom/vk/attachpicker/SelectionContext$SelectionCallback;

    .prologue
    .line 28
    iput-object p1, p0, Lcom/vk/attachpicker/SelectionContext;->selectionCallback:Lcom/vk/attachpicker/SelectionContext$SelectionCallback;

    .line 29
    return-void
.end method
