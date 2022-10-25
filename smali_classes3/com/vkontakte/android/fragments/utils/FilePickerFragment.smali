.class public Lcom/vkontakte/android/fragments/utils/FilePickerFragment;
.super Lcom/vkontakte/android/fragments/VKToolbarFragment;
.source "FilePickerFragment.java"

# interfaces
.implements Lcom/vkontakte/android/fragments/BackListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/fragments/utils/FilePickerFragment$HistoryEntry;,
        Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;,
        Lcom/vkontakte/android/fragments/utils/FilePickerFragment$FileListAdapter;,
        Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ViewHolder;,
        Lcom/vkontakte/android/fragments/utils/FilePickerFragment$Builder;
    }
.end annotation


# instance fields
.field private adapter:Lcom/vkontakte/android/fragments/utils/FilePickerFragment$FileListAdapter;

.field private currentDir:Ljava/io/File;

.field private empty:Lcom/vkontakte/android/ui/EmptyView;

.field private history:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/fragments/utils/FilePickerFragment$HistoryEntry;",
            ">;"
        }
    .end annotation
.end field

.field private items:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;",
            ">;"
        }
    .end annotation
.end field

.field private layoutManager:Landroid/support/v7/widget/LinearLayoutManager;

.field private list:Lme/grishka/appkit/views/UsableRecyclerView;

.field private receiver:Landroid/content/BroadcastReceiver;


# direct methods
.method public constructor <init>()V
    .locals 2

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/VKToolbarFragment;-><init>()V

    .line 86
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->items:Ljava/util/ArrayList;

    .line 87
    new-instance v0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$FileListAdapter;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$FileListAdapter;-><init>(Lcom/vkontakte/android/fragments/utils/FilePickerFragment;Lcom/vkontakte/android/fragments/utils/FilePickerFragment$1;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->adapter:Lcom/vkontakte/android/fragments/utils/FilePickerFragment$FileListAdapter;

    .line 88
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->history:Ljava/util/ArrayList;

    .line 92
    new-instance v0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$1;

    invoke-direct {v0, p0}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$1;-><init>(Lcom/vkontakte/android/fragments/utils/FilePickerFragment;)V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->receiver:Landroid/content/BroadcastReceiver;

    return-void
.end method

.method static synthetic access$100(Lcom/vkontakte/android/fragments/utils/FilePickerFragment;)Ljava/io/File;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/utils/FilePickerFragment;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->currentDir:Ljava/io/File;

    return-object v0
.end method

.method static synthetic access$1000(Lcom/vkontakte/android/fragments/utils/FilePickerFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/utils/FilePickerFragment;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->items:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$200(Lcom/vkontakte/android/fragments/utils/FilePickerFragment;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/utils/FilePickerFragment;

    .prologue
    .line 52
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->listRoots()V

    return-void
.end method

.method static synthetic access$300(Lcom/vkontakte/android/fragments/utils/FilePickerFragment;Ljava/io/File;)Z
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/utils/FilePickerFragment;
    .param p1, "x1"    # Ljava/io/File;

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->listFiles(Ljava/io/File;)Z

    move-result v0

    return v0
.end method

.method static synthetic access$500(Lcom/vkontakte/android/fragments/utils/FilePickerFragment;)Landroid/support/v7/widget/LinearLayoutManager;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/utils/FilePickerFragment;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->layoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    return-object v0
.end method

.method static synthetic access$600(Lcom/vkontakte/android/fragments/utils/FilePickerFragment;)Lme/grishka/appkit/views/UsableRecyclerView;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/utils/FilePickerFragment;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    return-object v0
.end method

.method static synthetic access$700(Lcom/vkontakte/android/fragments/utils/FilePickerFragment;)Ljava/util/ArrayList;
    .locals 1
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/utils/FilePickerFragment;

    .prologue
    .line 52
    iget-object v0, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->history:Ljava/util/ArrayList;

    return-object v0
.end method

.method static synthetic access$800(Lcom/vkontakte/android/fragments/utils/FilePickerFragment;Ljava/lang/CharSequence;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/utils/FilePickerFragment;
    .param p1, "x1"    # Ljava/lang/CharSequence;

    .prologue
    .line 52
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->setTitle(Ljava/lang/CharSequence;)V

    return-void
.end method

.method static synthetic access$900(Lcom/vkontakte/android/fragments/utils/FilePickerFragment;Ljava/lang/String;)V
    .locals 0
    .param p0, "x0"    # Lcom/vkontakte/android/fragments/utils/FilePickerFragment;
    .param p1, "x1"    # Ljava/lang/String;

    .prologue
    .line 52
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->showErrorBox(Ljava/lang/String;)V

    return-void
.end method

.method private getRootSubtitle(Ljava/lang/String;)Ljava/lang/String;
    .locals 10
    .param p1, "path"    # Ljava/lang/String;

    .prologue
    .line 218
    new-instance v2, Landroid/os/StatFs;

    invoke-direct {v2, p1}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 219
    .local v2, "stat":Landroid/os/StatFs;
    invoke-virtual {v2}, Landroid/os/StatFs;->getBlockCount()I

    move-result v3

    int-to-long v6, v3

    invoke-virtual {v2}, Landroid/os/StatFs;->getBlockSize()I

    move-result v3

    int-to-long v8, v3

    mul-long v4, v6, v8

    .line 220
    .local v4, "total":J
    invoke-virtual {v2}, Landroid/os/StatFs;->getAvailableBlocks()I

    move-result v3

    int-to-long v6, v3

    invoke-virtual {v2}, Landroid/os/StatFs;->getBlockSize()I

    move-result v3

    int-to-long v8, v3

    mul-long v0, v6, v8

    .line 221
    .local v0, "free":J
    const-string/jumbo v3, "vk"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, ": "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string/jumbo v7, "/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v3, v6}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 222
    const-wide/16 v6, 0x0

    cmp-long v3, v4, v6

    if-nez v3, :cond_0

    .line 223
    const-string/jumbo v3, ""

    .line 225
    :goto_0
    return-object v3

    :cond_0
    const v3, 0x7f080211

    const/4 v6, 0x2

    new-array v6, v6, [Ljava/lang/Object;

    const/4 v7, 0x0

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-static {v0, v1, v8}, Lcom/vkontakte/android/Global;->langFileSize(JLandroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    const/4 v7, 0x1

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v8

    invoke-static {v4, v5, v8}, Lcom/vkontakte/android/Global;->langFileSize(JLandroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v6, v7

    invoke-virtual {p0, v3, v6}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    goto :goto_0
.end method

.method private listFiles(Ljava/io/File;)Z
    .locals 14
    .param p1, "dir"    # Ljava/io/File;

    .prologue
    .line 143
    invoke-virtual {p1}, Ljava/io/File;->canRead()Z

    move-result v7

    if-nez v7, :cond_3

    .line 144
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v8

    invoke-virtual {v8}, Ljava/io/File;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "/sdcard"

    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_0

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "/mnt/sdcard"

    invoke-virtual {v7, v8}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 145
    :cond_0
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "mounted"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2

    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v8, "mounted_ro"

    invoke-virtual {v7, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_2

    .line 146
    iput-object p1, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->currentDir:Ljava/io/File;

    .line 147
    iget-object v7, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->clear()V

    .line 148
    invoke-static {}, Landroid/os/Environment;->getExternalStorageState()Ljava/lang/String;

    move-result-object v5

    .line 149
    .local v5, "state":Ljava/lang/String;
    const-string/jumbo v7, "shared"

    invoke-virtual {v7, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_1

    .line 150
    iget-object v7, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->empty:Lcom/vkontakte/android/ui/EmptyView;

    const v8, 0x7f080218

    invoke-virtual {v7, v8}, Lcom/vkontakte/android/ui/EmptyView;->setText(I)V

    .line 154
    :goto_0
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->updateList()V

    .line 155
    const/4 v7, 0x1

    .line 214
    .end local v5    # "state":Ljava/lang/String;
    :goto_1
    return v7

    .line 152
    .restart local v5    # "state":Ljava/lang/String;
    :cond_1
    iget-object v7, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->empty:Lcom/vkontakte/android/ui/EmptyView;

    const v8, 0x7f080213

    invoke-virtual {v7, v8}, Lcom/vkontakte/android/ui/EmptyView;->setText(I)V

    goto :goto_0

    .line 158
    .end local v5    # "state":Ljava/lang/String;
    :cond_2
    const v7, 0x7f08009f

    invoke-virtual {p0, v7}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->showErrorBox(Ljava/lang/String;)V

    .line 159
    const/4 v7, 0x0

    goto :goto_1

    .line 161
    :cond_3
    iget-object v7, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->empty:Lcom/vkontakte/android/ui/EmptyView;

    const v8, 0x7f08043d

    invoke-virtual {v7, v8}, Lcom/vkontakte/android/ui/EmptyView;->setText(I)V

    .line 164
    :try_start_0
    invoke-virtual {p1}, Ljava/io/File;->listFiles()[Ljava/io/File;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v1

    .line 170
    .local v1, "files":[Ljava/io/File;
    if-nez v1, :cond_4

    .line 171
    const v7, 0x7f08071f

    invoke-virtual {p0, v7}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->showErrorBox(Ljava/lang/String;)V

    .line 172
    const/4 v7, 0x0

    goto :goto_1

    .line 165
    .end local v1    # "files":[Ljava/io/File;
    :catch_0
    move-exception v6

    .line 166
    .local v6, "x":Ljava/lang/Exception;
    const-string/jumbo v7, "vk"

    invoke-static {v7, v6}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 167
    invoke-virtual {v6}, Ljava/lang/Exception;->getLocalizedMessage()Ljava/lang/String;

    move-result-object v7

    invoke-direct {p0, v7}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->showErrorBox(Ljava/lang/String;)V

    .line 168
    const/4 v7, 0x0

    goto :goto_1

    .line 174
    .end local v6    # "x":Ljava/lang/Exception;
    .restart local v1    # "files":[Ljava/io/File;
    :cond_4
    iput-object p1, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->currentDir:Ljava/io/File;

    .line 175
    iget-object v7, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v7}, Ljava/util/ArrayList;->clear()V

    .line 176
    new-instance v7, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$2;

    invoke-direct {v7, p0}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$2;-><init>(Lcom/vkontakte/android/fragments/utils/FilePickerFragment;)V

    invoke-static {v1, v7}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V

    .line 185
    array-length v9, v1

    const/4 v7, 0x0

    move v8, v7

    :goto_2
    if-ge v8, v9, :cond_b

    aget-object v0, v1, v8

    .line 186
    .local v0, "file":Ljava/io/File;
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v10, "."

    invoke-virtual {v7, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_5

    .line 185
    :goto_3
    add-int/lit8 v7, v8, 0x1

    move v8, v7

    goto :goto_2

    .line 189
    :cond_5
    new-instance v3, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;

    invoke-direct {v3}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;-><init>()V

    .line 190
    .local v3, "item":Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v7

    iput-object v7, v3, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;->title:Ljava/lang/String;

    .line 191
    iput-object v0, v3, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;->file:Ljava/io/File;

    .line 192
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v7

    if-eqz v7, :cond_7

    .line 193
    const v7, 0x7f020199

    iput v7, v3, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;->icon:I

    .line 211
    :cond_6
    :goto_4
    iget-object v7, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v7, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3

    .line 195
    :cond_7
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v2

    .line 196
    .local v2, "fname":Ljava/lang/String;
    const-string/jumbo v7, "\\."

    invoke-virtual {v2, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 197
    .local v4, "sp":[Ljava/lang/String;
    array-length v7, v4

    const/4 v10, 0x1

    if-le v7, v10, :cond_a

    array-length v7, v4

    add-int/lit8 v7, v7, -0x1

    aget-object v7, v4, v7

    :goto_5
    iput-object v7, v3, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;->ext:Ljava/lang/String;

    .line 198
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v10

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    invoke-static {v10, v11, v7}, Lcom/vkontakte/android/Global;->langFileSize(JLandroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v3, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;->subtitle:Ljava/lang/String;

    .line 199
    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v10

    const-wide/16 v12, 0x0

    cmp-long v7, v10, v12

    if-lez v7, :cond_8

    .line 200
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v10, v3, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;->subtitle:Ljava/lang/String;

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v10, ", "

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v0}, Ljava/io/File;->lastModified()J

    move-result-wide v10

    const-wide/16 v12, 0x3e8

    div-long/2addr v10, v12

    long-to-int v10, v10

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->getResources()Landroid/content/res/Resources;

    move-result-object v11

    invoke-static {v10, v11}, Lcom/vkontakte/android/TimeUtils;->langDateRelativeNoDiff(ILandroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    iput-object v7, v3, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;->subtitle:Ljava/lang/String;

    .line 202
    :cond_8
    invoke-virtual {v2}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v2

    .line 203
    const-string/jumbo v7, ".jpg"

    invoke-virtual {v2, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_9

    const-string/jumbo v7, ".png"

    invoke-virtual {v2, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_9

    const-string/jumbo v7, ".gif"

    invoke-virtual {v2, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_9

    const-string/jumbo v7, ".jpeg"

    invoke-virtual {v2, v7}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_6

    .line 204
    :cond_9
    new-instance v7, Landroid/net/Uri$Builder;

    invoke-direct {v7}, Landroid/net/Uri$Builder;-><init>()V

    const-string/jumbo v10, "file"

    invoke-virtual {v7, v10}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v7

    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v10}, Landroid/net/Uri$Builder;->path(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v7

    const-string/jumbo v10, "max_w"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const/high16 v12, 0x42800000    # 64.0f

    .line 205
    invoke-static {v12}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string/jumbo v12, ""

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v7, v10, v11}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v7

    const-string/jumbo v10, "max_h"

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const/high16 v12, 0x42400000    # 48.0f

    .line 206
    invoke-static {v12}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v11

    const-string/jumbo v12, ""

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v7, v10, v11}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v7

    .line 207
    invoke-virtual {v7}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v7

    invoke-virtual {v7}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v7

    const-string/jumbo v10, "file:/"

    const-string/jumbo v11, "file:///"

    invoke-virtual {v7, v10, v11}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v7

    iput-object v7, v3, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;->thumb:Ljava/lang/String;

    goto/16 :goto_4

    .line 197
    :cond_a
    const-string/jumbo v7, "?"

    goto/16 :goto_5

    .line 213
    .end local v0    # "file":Ljava/io/File;
    .end local v2    # "fname":Ljava/lang/String;
    .end local v3    # "item":Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;
    .end local v4    # "sp":[Ljava/lang/String;
    :cond_b
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->updateList()V

    .line 214
    const/4 v7, 0x1

    goto/16 :goto_1
.end method

.method private listRoots()V
    .locals 15

    .prologue
    .line 229
    const v13, 0x7f0804b5

    invoke-virtual {p0, v13}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->setTitle(I)V

    .line 230
    const/4 v13, 0x0

    iput-object v13, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->currentDir:Ljava/io/File;

    .line 231
    iget-object v13, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v13}, Ljava/util/ArrayList;->clear()V

    .line 232
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v13

    invoke-virtual {v13}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v3

    .line 233
    .local v3, "extStorage":Ljava/lang/String;
    new-instance v1, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;

    invoke-direct {v1}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;-><init>()V

    .line 234
    .local v1, "ext":Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;
    invoke-static {}, Landroid/os/Environment;->isExternalStorageRemovable()Z

    move-result v13

    if-eqz v13, :cond_5

    const v13, 0x7f080215

    :goto_0
    invoke-virtual {p0, v13}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->getString(I)Ljava/lang/String;

    move-result-object v13

    iput-object v13, v1, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;->title:Ljava/lang/String;

    .line 235
    invoke-static {}, Landroid/os/Environment;->isExternalStorageRemovable()Z

    move-result v13

    if-eqz v13, :cond_6

    const v13, 0x7f0201ad

    :goto_1
    iput v13, v1, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;->icon:I

    .line 236
    invoke-direct {p0, v3}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->getRootSubtitle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    iput-object v13, v1, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;->subtitle:Ljava/lang/String;

    .line 237
    invoke-static {}, Landroid/os/Environment;->getExternalStorageDirectory()Ljava/io/File;

    move-result-object v13

    iput-object v13, v1, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;->file:Ljava/io/File;

    .line 238
    iget-object v13, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v13, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 240
    :try_start_0
    new-instance v10, Ljava/io/BufferedReader;

    new-instance v13, Ljava/io/FileReader;

    const-string/jumbo v14, "/proc/mounts"

    invoke-direct {v13, v14}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    invoke-direct {v10, v13}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 242
    .local v10, "reader":Ljava/io/BufferedReader;
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 243
    .local v0, "aliases":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 244
    .local v11, "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const/4 v2, 0x0

    .line 245
    .local v2, "extDevice":Ljava/lang/String;
    :cond_0
    :goto_2
    invoke-virtual {v10}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v8

    .local v8, "line":Ljava/lang/String;
    if-eqz v8, :cond_7

    .line 246
    const-string/jumbo v13, "/mnt"

    invoke-virtual {v8, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_1

    const-string/jumbo v13, "/storage"

    invoke-virtual {v8, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_1

    const-string/jumbo v13, "/sdcard"

    invoke-virtual {v8, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-eqz v13, :cond_0

    :cond_1
    const-string/jumbo v13, "asec"

    invoke-virtual {v8, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_0

    const-string/jumbo v13, "tmpfs"

    invoke-virtual {v8, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_0

    const-string/jumbo v13, "none"

    invoke-virtual {v8, v13}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-nez v13, :cond_0

    .line 249
    const-string/jumbo v13, " "

    invoke-virtual {v8, v13}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v5

    .line 250
    .local v5, "info":[Ljava/lang/String;
    const/4 v13, 0x0

    aget-object v13, v5, v13

    invoke-virtual {v0, v13}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_2

    .line 251
    const/4 v13, 0x0

    aget-object v13, v5, v13

    new-instance v14, Ljava/util/ArrayList;

    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0, v13, v14}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 253
    :cond_2
    const/4 v13, 0x0

    aget-object v13, v5, v13

    invoke-virtual {v0, v13}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/ArrayList;

    const/4 v14, 0x1

    aget-object v14, v5, v14

    invoke-virtual {v13, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 254
    const/4 v13, 0x1

    aget-object v13, v5, v13

    invoke-virtual {v13, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-eqz v13, :cond_3

    .line 255
    const/4 v13, 0x0

    aget-object v2, v5, v13

    .line 257
    :cond_3
    const/4 v13, 0x1

    aget-object v13, v5, v13

    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    .line 276
    .end local v0    # "aliases":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .end local v2    # "extDevice":Ljava/lang/String;
    .end local v5    # "info":[Ljava/lang/String;
    .end local v8    # "line":Ljava/lang/String;
    .end local v10    # "reader":Ljava/io/BufferedReader;
    .end local v11    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :catch_0
    move-exception v12

    .line 277
    .local v12, "x":Ljava/lang/Exception;
    const-string/jumbo v13, "vk"

    invoke-static {v13, v12}, Lcom/vkontakte/android/Log;->w(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 279
    .end local v12    # "x":Ljava/lang/Exception;
    :cond_4
    new-instance v4, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;

    invoke-direct {v4}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;-><init>()V

    .line 280
    .local v4, "fs":Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;
    const-string/jumbo v13, "/"

    iput-object v13, v4, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;->title:Ljava/lang/String;

    .line 281
    const v13, 0x7f080216

    invoke-virtual {p0, v13}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->getString(I)Ljava/lang/String;

    move-result-object v13

    iput-object v13, v4, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;->subtitle:Ljava/lang/String;

    .line 282
    const v13, 0x7f020199

    iput v13, v4, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;->icon:I

    .line 283
    new-instance v13, Ljava/io/File;

    const-string/jumbo v14, "/"

    invoke-direct {v13, v14}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v13, v4, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;->file:Ljava/io/File;

    .line 284
    iget-object v13, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v13, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 285
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->updateList()V

    .line 286
    return-void

    .line 234
    .end local v4    # "fs":Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;
    :cond_5
    const v13, 0x7f080212

    goto/16 :goto_0

    .line 235
    :cond_6
    const v13, 0x7f0202ad

    goto/16 :goto_1

    .line 259
    .restart local v0    # "aliases":Ljava/util/HashMap;, "Ljava/util/HashMap<Ljava/lang/String;Ljava/util/ArrayList<Ljava/lang/String;>;>;"
    .restart local v2    # "extDevice":Ljava/lang/String;
    .restart local v8    # "line":Ljava/lang/String;
    .restart local v10    # "reader":Ljava/io/BufferedReader;
    .restart local v11    # "result":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    :cond_7
    :try_start_1
    invoke-virtual {v10}, Ljava/io/BufferedReader;->close()V

    .line 260
    if-eqz v2, :cond_4

    .line 261
    invoke-virtual {v0, v2}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Ljava/util/Collection;

    invoke-virtual {v11, v13}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    .line 262
    invoke-virtual {v11}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_3
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v13

    if-eqz v13, :cond_4

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 264
    .local v9, "path":Ljava/lang/String;
    :try_start_2
    invoke-static {v9}, Lcom/vkontakte/android/audio/utils/Utils;->isSdCardPath(Ljava/lang/String;)Z

    move-result v6

    .line 265
    .local v6, "isSd":Z
    new-instance v7, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;

    invoke-direct {v7}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;-><init>()V

    .line 266
    .local v7, "item":Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;
    if-eqz v6, :cond_8

    const v13, 0x7f080215

    :goto_4
    invoke-virtual {p0, v13}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->getString(I)Ljava/lang/String;

    move-result-object v13

    iput-object v13, v7, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;->title:Ljava/lang/String;

    .line 267
    const v13, 0x7f0201ad

    iput v13, v7, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;->icon:I

    .line 268
    invoke-direct {p0, v9}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->getRootSubtitle(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    iput-object v13, v7, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;->subtitle:Ljava/lang/String;

    .line 269
    new-instance v13, Ljava/io/File;

    invoke-direct {v13, v9}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    iput-object v13, v7, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;->file:Ljava/io/File;

    .line 270
    iget-object v13, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->items:Ljava/util/ArrayList;

    invoke-virtual {v13, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_3

    .line 271
    .end local v6    # "isSd":Z
    .end local v7    # "item":Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;
    :catch_1
    move-exception v13

    goto :goto_3

    .line 266
    .restart local v6    # "isSd":Z
    .restart local v7    # "item":Lcom/vkontakte/android/fragments/utils/FilePickerFragment$ListItem;
    :cond_8
    const v13, 0x7f080210

    goto :goto_4
.end method

.method private showErrorBox(Ljava/lang/String;)V
    .locals 3
    .param p1, "error"    # Ljava/lang/String;

    .prologue
    .line 138
    new-instance v0, Lcom/vkontakte/android/VKAlertDialog$Builder;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const v1, 0x7f0801f9

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/VKAlertDialog$Builder;->setTitle(I)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const v1, 0x7f080479

    const/4 v2, 0x0

    .line 139
    invoke-virtual {v0, v1, v2}, Landroid/app/AlertDialog$Builder;->setPositiveButton(ILandroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;

    .line 140
    return-void
.end method

.method private updateList()V
    .locals 1

    .prologue
    .line 314
    iget-object v0, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->adapter:Lcom/vkontakte/android/fragments/utils/FilePickerFragment$FileListAdapter;

    invoke-virtual {v0}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$FileListAdapter;->notifyDataSetChanged()V

    .line 315
    return-void
.end method


# virtual methods
.method public onBackPressed()Z
    .locals 4

    .prologue
    .line 298
    iget-object v1, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->history:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    if-lez v1, :cond_1

    .line 299
    iget-object v1, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->history:Ljava/util/ArrayList;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->history:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$HistoryEntry;

    .line 300
    .local v0, "he":Lcom/vkontakte/android/fragments/utils/FilePickerFragment$HistoryEntry;
    iget-object v1, v0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$HistoryEntry;->title:Ljava/lang/String;

    invoke-virtual {p0, v1}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->setTitle(Ljava/lang/CharSequence;)V

    .line 301
    iget-object v1, v0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$HistoryEntry;->dir:Ljava/io/File;

    if-eqz v1, :cond_0

    .line 302
    iget-object v1, v0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$HistoryEntry;->dir:Ljava/io/File;

    invoke-direct {p0, v1}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->listFiles(Ljava/io/File;)Z

    .line 306
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->layoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    iget v2, v0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$HistoryEntry;->scrollItem:I

    iget v3, v0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment$HistoryEntry;->scrollOffset:I

    invoke-virtual {v1, v2, v3}, Landroid/support/v7/widget/LinearLayoutManager;->scrollToPositionWithOffset(II)V

    .line 307
    const/4 v1, 0x1

    .line 309
    .end local v0    # "he":Lcom/vkontakte/android/fragments/utils/FilePickerFragment$HistoryEntry;
    :goto_1
    return v1

    .line 304
    .restart local v0    # "he":Lcom/vkontakte/android/fragments/utils/FilePickerFragment$HistoryEntry;
    :cond_0
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->listRoots()V

    goto :goto_0

    .line 309
    .end local v0    # "he":Lcom/vkontakte/android/fragments/utils/FilePickerFragment$HistoryEntry;
    :cond_1
    const/4 v1, 0x0

    goto :goto_1
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "b"    # Landroid/os/Bundle;

    .prologue
    .line 114
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onCreate(Landroid/os/Bundle;)V

    .line 116
    invoke-direct {p0}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->listRoots()V

    .line 118
    new-instance v0, Landroid/content/IntentFilter;

    invoke-direct {v0}, Landroid/content/IntentFilter;-><init>()V

    .line 119
    .local v0, "filter":Landroid/content/IntentFilter;
    const-string/jumbo v1, "android.intent.action.MEDIA_BAD_REMOVAL"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 120
    const-string/jumbo v1, "android.intent.action.MEDIA_CHECKING"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 121
    const-string/jumbo v1, "android.intent.action.MEDIA_EJECT"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 122
    const-string/jumbo v1, "android.intent.action.MEDIA_MOUNTED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 123
    const-string/jumbo v1, "android.intent.action.MEDIA_NOFS"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 124
    const-string/jumbo v1, "android.intent.action.MEDIA_REMOVED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 125
    const-string/jumbo v1, "android.intent.action.MEDIA_SHARED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 126
    const-string/jumbo v1, "android.intent.action.MEDIA_UNMOUNTABLE"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 127
    const-string/jumbo v1, "android.intent.action.MEDIA_UNMOUNTED"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 128
    const-string/jumbo v1, "file"

    invoke-virtual {v0, v1}, Landroid/content/IntentFilter;->addDataScheme(Ljava/lang/String;)V

    .line 129
    sget-object v1, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v1, v2, v0}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 130
    return-void
.end method

.method public onCreateContentView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .locals 5
    .param p1, "inflater"    # Landroid/view/LayoutInflater;
    .param p2, "container"    # Landroid/view/ViewGroup;
    .param p3, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/high16 v3, 0x41000000    # 8.0f

    const/4 v4, 0x0

    .line 67
    new-instance v0, Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 68
    .local v0, "contentView":Landroid/widget/FrameLayout;
    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->setBackgroundColor(I)V

    .line 69
    new-instance v1, Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->getActivity()Landroid/app/Activity;

    move-result-object v2

    invoke-direct {v1, v2}, Lme/grishka/appkit/views/UsableRecyclerView;-><init>(Landroid/content/Context;)V

    iput-object v1, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    .line 70
    iget-object v1, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v2

    invoke-static {v3}, Lme/grishka/appkit/utils/V;->dp(F)I

    move-result v3

    invoke-virtual {v1, v4, v2, v4, v3}, Lme/grishka/appkit/views/UsableRecyclerView;->setPadding(IIII)V

    .line 71
    iget-object v1, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v1, v4}, Lme/grishka/appkit/views/UsableRecyclerView;->setClipToPadding(Z)V

    .line 72
    iget-object v1, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    new-instance v2, Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/support/v7/widget/LinearLayoutManager;-><init>(Landroid/content/Context;)V

    iput-object v2, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->layoutManager:Landroid/support/v7/widget/LinearLayoutManager;

    invoke-virtual {v1, v2}, Lme/grishka/appkit/views/UsableRecyclerView;->setLayoutManager(Landroid/support/v7/widget/RecyclerView$LayoutManager;)V

    .line 73
    iget-object v1, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->adapter:Lcom/vkontakte/android/fragments/utils/FilePickerFragment$FileListAdapter;

    invoke-virtual {v1, v2}, Lme/grishka/appkit/views/UsableRecyclerView;->setAdapter(Landroid/support/v7/widget/RecyclerView$Adapter;)V

    .line 74
    iget-object v1, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    const v2, 0x7f02013e

    invoke-virtual {v1, v2}, Lme/grishka/appkit/views/UsableRecyclerView;->setSelector(I)V

    .line 75
    iget-object v1, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 76
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-static {v1}, Lcom/vkontakte/android/ui/EmptyView;->create(Landroid/content/Context;)Lcom/vkontakte/android/ui/EmptyView;

    move-result-object v1

    iput-object v1, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->empty:Lcom/vkontakte/android/ui/EmptyView;

    .line 77
    iget-object v1, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->empty:Lcom/vkontakte/android/ui/EmptyView;

    invoke-virtual {v1, v4}, Lcom/vkontakte/android/ui/EmptyView;->setButtonVisible(Z)V

    .line 78
    iget-object v1, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->empty:Lcom/vkontakte/android/ui/EmptyView;

    const v2, 0x7f08043d

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/EmptyView;->setText(I)V

    .line 79
    iget-object v1, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->empty:Lcom/vkontakte/android/ui/EmptyView;

    invoke-virtual {v0, v1}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 80
    iget-object v1, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->list:Lme/grishka/appkit/views/UsableRecyclerView;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->empty:Lcom/vkontakte/android/ui/EmptyView;

    invoke-virtual {v1, v2}, Lme/grishka/appkit/views/UsableRecyclerView;->setEmptyView(Landroid/view/View;)V

    .line 81
    return-object v0
.end method

.method public onDestroy()V
    .locals 2

    .prologue
    .line 133
    invoke-super {p0}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onDestroy()V

    .line 134
    sget-object v0, Lcom/vkontakte/android/VKApplication;->context:Landroid/content/Context;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->receiver:Landroid/content/BroadcastReceiver;

    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    .line 135
    return-void
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 2
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 289
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x102002c

    if-ne v0, v1, :cond_0

    .line 290
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/utils/FilePickerFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 291
    const/4 v0, 0x1

    .line 293
    :goto_0
    return v0

    :cond_0
    invoke-super {p0, p1}, Lcom/vkontakte/android/fragments/VKToolbarFragment;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v0

    goto :goto_0
.end method
