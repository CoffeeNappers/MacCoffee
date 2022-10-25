.class public Lcom/vkontakte/android/ShortcutManagerWrapper;
.super Ljava/lang/Object;
.source "ShortcutManagerWrapper.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/ShortcutManagerWrapper$Holder;
    }
.end annotation


# static fields
.field private static final NEW_POST_SHORTCUT_ID:Ljava/lang/String; = "NewPostShortcut"

.field private static final NEW_STORY_SHORTCUT_ID:Ljava/lang/String; = "NewStoryShortcut"

.field private static final SHORTCUT_EXTRA_PHOTO_KEY:Ljava/lang/String; = "ExtraPhotoKey"

.field private static final TAG:Ljava/lang/String; = "ShortcutManagerWrapper"


# instance fields
.field private lastPeerIdsUsedForShortcuts:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/ShortcutManagerWrapper;->lastPeerIdsUsedForShortcuts:Ljava/util/ArrayList;

    return-void
.end method

.method private createShortcutForDialogEntry(Landroid/content/Context;Lcom/vkontakte/android/DialogEntry;)Landroid/content/pm/ShortcutInfo;
    .locals 6
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "de"    # Lcom/vkontakte/android/DialogEntry;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x19
    .end annotation

    .prologue
    .line 254
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v3, "android.intent.action.VIEW"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v5, "vkontakte://vk.com/write"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    iget-object v5, p2, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v5, v5, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    invoke-direct {v0, v3, v4}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 256
    .local v0, "intent":Landroid/content/Intent;
    new-instance v1, Landroid/os/PersistableBundle;

    invoke-direct {v1}, Landroid/os/PersistableBundle;-><init>()V

    .line 259
    .local v1, "pb":Landroid/os/PersistableBundle;
    const-string/jumbo v3, "ExtraPhotoKey"

    iget-object v4, p2, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v1, v3, v4}, Landroid/os/PersistableBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 261
    new-instance v3, Landroid/content/pm/ShortcutInfo$Builder;

    iget-object v4, p2, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v4, v4, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-direct {p0, v4}, Lcom/vkontakte/android/ShortcutManagerWrapper;->getDialogShortcutId(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, p1, v4}, Landroid/content/pm/ShortcutInfo$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iget-object v4, p2, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 262
    invoke-virtual {v3, v4}, Landroid/content/pm/ShortcutInfo$Builder;->setShortLabel(Ljava/lang/CharSequence;)Landroid/content/pm/ShortcutInfo$Builder;

    move-result-object v3

    iget-object v4, p2, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 263
    invoke-virtual {v3, v4}, Landroid/content/pm/ShortcutInfo$Builder;->setLongLabel(Ljava/lang/CharSequence;)Landroid/content/pm/ShortcutInfo$Builder;

    move-result-object v3

    iget-object v4, p2, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 264
    invoke-static {v4}, Lcom/vkontakte/android/data/Messages;->createShortcutIcon(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v4

    invoke-static {v4}, Landroid/graphics/drawable/Icon;->createWithBitmap(Landroid/graphics/Bitmap;)Landroid/graphics/drawable/Icon;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/content/pm/ShortcutInfo$Builder;->setIcon(Landroid/graphics/drawable/Icon;)Landroid/content/pm/ShortcutInfo$Builder;

    move-result-object v3

    .line 265
    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/ShortcutManagerWrapper;->getIntentsForHandlingShortcut(Landroid/content/Context;Landroid/content/Intent;)[Landroid/content/Intent;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/content/pm/ShortcutInfo$Builder;->setIntents([Landroid/content/Intent;)Landroid/content/pm/ShortcutInfo$Builder;

    move-result-object v3

    .line 266
    invoke-virtual {v3, v1}, Landroid/content/pm/ShortcutInfo$Builder;->setExtras(Landroid/os/PersistableBundle;)Landroid/content/pm/ShortcutInfo$Builder;

    move-result-object v3

    .line 267
    invoke-virtual {v3}, Landroid/content/pm/ShortcutInfo$Builder;->build()Landroid/content/pm/ShortcutInfo;

    move-result-object v2

    .line 269
    .local v2, "shortcutInfo":Landroid/content/pm/ShortcutInfo;
    return-object v2
.end method

.method private createShortcutForNewPost(Landroid/content/Context;)Landroid/content/pm/ShortcutInfo;
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x19
    .end annotation

    .prologue
    const v4, 0x7f08050a

    .line 274
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.VIEW"

    const-string/jumbo v3, "vkontakte://new_post"

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 276
    .local v0, "intent":Landroid/content/Intent;
    new-instance v2, Landroid/content/pm/ShortcutInfo$Builder;

    const-string/jumbo v3, "NewPostShortcut"

    invoke-direct {v2, p1, v3}, Landroid/content/pm/ShortcutInfo$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 277
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/pm/ShortcutInfo$Builder;->setShortLabel(Ljava/lang/CharSequence;)Landroid/content/pm/ShortcutInfo$Builder;

    move-result-object v2

    .line 278
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/pm/ShortcutInfo$Builder;->setLongLabel(Ljava/lang/CharSequence;)Landroid/content/pm/ShortcutInfo$Builder;

    move-result-object v2

    .line 279
    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/ShortcutManagerWrapper;->getIntentsForHandlingShortcut(Landroid/content/Context;Landroid/content/Intent;)[Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/pm/ShortcutInfo$Builder;->setIntents([Landroid/content/Intent;)Landroid/content/pm/ShortcutInfo$Builder;

    move-result-object v2

    const v3, 0x7f02028d

    .line 280
    invoke-static {p1, v3}, Landroid/graphics/drawable/Icon;->createWithResource(Landroid/content/Context;I)Landroid/graphics/drawable/Icon;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/pm/ShortcutInfo$Builder;->setIcon(Landroid/graphics/drawable/Icon;)Landroid/content/pm/ShortcutInfo$Builder;

    move-result-object v2

    .line 281
    invoke-virtual {v2}, Landroid/content/pm/ShortcutInfo$Builder;->build()Landroid/content/pm/ShortcutInfo;

    move-result-object v1

    .line 283
    .local v1, "shortcutInfo":Landroid/content/pm/ShortcutInfo;
    return-object v1
.end method

.method private createShortcutForNewStory(Landroid/content/Context;)Landroid/content/pm/ShortcutInfo;
    .locals 5
    .param p1, "context"    # Landroid/content/Context;
    .annotation build Landroid/annotation/TargetApi;
        value = 0x19
    .end annotation

    .prologue
    const v4, 0x7f0806cb

    .line 289
    new-instance v0, Landroid/content/Intent;

    const-string/jumbo v2, "android.intent.action.VIEW"

    const-string/jumbo v3, "vkontakte://new_story"

    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-direct {v0, v2, v3}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 291
    .local v0, "intent":Landroid/content/Intent;
    new-instance v2, Landroid/content/pm/ShortcutInfo$Builder;

    const-string/jumbo v3, "NewStoryShortcut"

    invoke-direct {v2, p1, v3}, Landroid/content/pm/ShortcutInfo$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 292
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/pm/ShortcutInfo$Builder;->setShortLabel(Ljava/lang/CharSequence;)Landroid/content/pm/ShortcutInfo$Builder;

    move-result-object v2

    .line 293
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/pm/ShortcutInfo$Builder;->setLongLabel(Ljava/lang/CharSequence;)Landroid/content/pm/ShortcutInfo$Builder;

    move-result-object v2

    .line 294
    invoke-direct {p0, p1, v0}, Lcom/vkontakte/android/ShortcutManagerWrapper;->getIntentsForHandlingShortcut(Landroid/content/Context;Landroid/content/Intent;)[Landroid/content/Intent;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/pm/ShortcutInfo$Builder;->setIntents([Landroid/content/Intent;)Landroid/content/pm/ShortcutInfo$Builder;

    move-result-object v2

    const v3, 0x7f02028e

    .line 295
    invoke-static {p1, v3}, Landroid/graphics/drawable/Icon;->createWithResource(Landroid/content/Context;I)Landroid/graphics/drawable/Icon;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/content/pm/ShortcutInfo$Builder;->setIcon(Landroid/graphics/drawable/Icon;)Landroid/content/pm/ShortcutInfo$Builder;

    move-result-object v2

    .line 296
    invoke-virtual {v2}, Landroid/content/pm/ShortcutInfo$Builder;->build()Landroid/content/pm/ShortcutInfo;

    move-result-object v1

    .line 298
    .local v1, "shortcutInfo":Landroid/content/pm/ShortcutInfo;
    return-object v1
.end method

.method private getDialogPeerId(Ljava/lang/String;)I
    .locals 5
    .param p1, "dialogShortcutId"    # Ljava/lang/String;

    .prologue
    const/4 v3, 0x0

    .line 337
    const/16 v4, 0x5f

    invoke-virtual {p1, v4}, Ljava/lang/String;->indexOf(I)I

    move-result v0

    .line 339
    .local v0, "ind":I
    if-gez v0, :cond_1

    .line 352
    :cond_0
    :goto_0
    return v3

    .line 343
    :cond_1
    invoke-virtual {p1, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v2

    .line 345
    .local v2, "shortcutUserId":Ljava/lang/String;
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v4

    invoke-virtual {v4}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 350
    add-int/lit8 v3, v0, 0x1

    invoke-virtual {p1, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    .line 352
    .local v1, "peerIdStr":Ljava/lang/String;
    invoke-static {v1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v3

    goto :goto_0
.end method

.method private getDialogShortcutId(I)Ljava/lang/String;
    .locals 2
    .param p1, "peerId"    # I

    .prologue
    .line 328
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v1

    invoke-virtual {v1}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string/jumbo v1, "_"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static getInstance()Lcom/vkontakte/android/ShortcutManagerWrapper;
    .locals 1

    .prologue
    .line 45
    invoke-static {}, Lcom/vkontakte/android/ShortcutManagerWrapper$Holder;->access$000()Lcom/vkontakte/android/ShortcutManagerWrapper;

    move-result-object v0

    return-object v0
.end method

.method private getIntentsForHandlingShortcut(Landroid/content/Context;Landroid/content/Intent;)[Landroid/content/Intent;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;
    .param p2, "targetIntent"    # Landroid/content/Intent;

    .prologue
    const/4 v2, 0x0

    .line 302
    const/4 v1, 0x2

    new-array v0, v1, [Landroid/content/Intent;

    .line 303
    .local v0, "intents":[Landroid/content/Intent;
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ShortcutManagerWrapper;->getMainActivityIntent(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    aput-object v1, v0, v2

    .line 304
    aget-object v1, v0, v2

    const v2, 0x10008000

    invoke-virtual {v1, v2}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 307
    const/4 v1, 0x1

    aput-object p2, v0, v1

    .line 308
    return-object v0
.end method

.method private getMainActivityIntent(Landroid/content/Context;)Landroid/content/Intent;
    .locals 3
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 313
    invoke-virtual {p1}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 314
    .local v1, "pm":Landroid/content/pm/PackageManager;
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->getLaunchIntentForPackage(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    .line 322
    .local v0, "intent":Landroid/content/Intent;
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setPackage(Ljava/lang/String;)Landroid/content/Intent;

    .line 324
    return-object v0
.end method

.method private isDialogShortcutBelongingToCurrentUser(Ljava/lang/String;)Z
    .locals 1
    .param p1, "shortcutId"    # Ljava/lang/String;

    .prologue
    .line 332
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ShortcutManagerWrapper;->getDialogPeerId(Ljava/lang/String;)I

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method public ensureShortcuts(Landroid/content/Context;)V
    .locals 5
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 50
    :try_start_0
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x19

    if-lt v3, v4, :cond_0

    .line 52
    if-nez p1, :cond_1

    .line 79
    :cond_0
    :goto_0
    return-void

    .line 56
    :cond_1
    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v3

    invoke-virtual {v3}, Lcom/vkontakte/android/auth/VKAccount;->isReal()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 58
    const-class v3, Landroid/content/pm/ShortcutManager;

    invoke-virtual {p1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/content/pm/ShortcutManager;

    .line 60
    .local v2, "shortcutManager":Landroid/content/pm/ShortcutManager;
    invoke-virtual {v2}, Landroid/content/pm/ShortcutManager;->getDynamicShortcuts()Ljava/util/List;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v3

    if-nez v3, :cond_0

    .line 65
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 67
    .local v1, "shortcutList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/pm/ShortcutInfo;>;"
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ShortcutManagerWrapper;->createShortcutForNewStory(Landroid/content/Context;)Landroid/content/pm/ShortcutInfo;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 69
    invoke-direct {p0, p1}, Lcom/vkontakte/android/ShortcutManagerWrapper;->createShortcutForNewPost(Landroid/content/Context;)Landroid/content/pm/ShortcutInfo;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 71
    invoke-virtual {v2, v1}, Landroid/content/pm/ShortcutManager;->setDynamicShortcuts(Ljava/util/List;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 76
    .end local v1    # "shortcutList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/pm/ShortcutInfo;>;"
    .end local v2    # "shortcutManager":Landroid/content/pm/ShortcutManager;
    :catch_0
    move-exception v0

    .line 77
    .local v0, "exc":Ljava/lang/Exception;
    const-string/jumbo v3, "ShortcutManagerWrapper"

    const-string/jumbo v4, "ensureShortcuts failed"

    invoke-static {v3, v4, v0}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0
.end method

.method public respondToUserLogin(Landroid/content/Context;)V
    .locals 8
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 214
    :try_start_0
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x19

    if-lt v6, v7, :cond_0

    .line 216
    if-nez p1, :cond_1

    .line 247
    :cond_0
    :goto_0
    return-void

    .line 220
    :cond_1
    const-class v6, Landroid/content/pm/ShortcutManager;

    invoke-virtual {p1, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/pm/ShortcutManager;

    .line 224
    .local v4, "shortcutManager":Landroid/content/pm/ShortcutManager;
    invoke-virtual {v4}, Landroid/content/pm/ShortcutManager;->getPinnedShortcuts()Ljava/util/List;

    move-result-object v3

    .line 225
    .local v3, "pinnedList":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ShortcutInfo;>;"
    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v6

    if-lez v6, :cond_5

    .line 226
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 227
    .local v2, "idsToBeEnabled":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_2
    :goto_1
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_4

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/pm/ShortcutInfo;

    .line 228
    .local v5, "si":Landroid/content/pm/ShortcutInfo;
    invoke-virtual {v5}, Landroid/content/pm/ShortcutInfo;->getId()Ljava/lang/String;

    move-result-object v1

    .line 229
    .local v1, "id":Ljava/lang/String;
    const-string/jumbo v7, "NewPostShortcut"

    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_3

    const-string/jumbo v7, "NewStoryShortcut"

    .line 230
    invoke-virtual {v1, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_3

    .line 231
    invoke-direct {p0, v1}, Lcom/vkontakte/android/ShortcutManagerWrapper;->isDialogShortcutBelongingToCurrentUser(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_2

    .line 232
    :cond_3
    invoke-interface {v2, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 244
    .end local v1    # "id":Ljava/lang/String;
    .end local v2    # "idsToBeEnabled":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v3    # "pinnedList":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ShortcutInfo;>;"
    .end local v4    # "shortcutManager":Landroid/content/pm/ShortcutManager;
    .end local v5    # "si":Landroid/content/pm/ShortcutInfo;
    :catch_0
    move-exception v0

    .line 245
    .local v0, "e":Ljava/lang/Exception;
    const-string/jumbo v6, "ShortcutManagerWrapper"

    const-string/jumbo v7, "respondToUserLogout failed"

    invoke-static {v6, v7, v0}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 236
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v2    # "idsToBeEnabled":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v3    # "pinnedList":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ShortcutInfo;>;"
    .restart local v4    # "shortcutManager":Landroid/content/pm/ShortcutManager;
    :cond_4
    :try_start_1
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v6

    if-lez v6, :cond_5

    .line 237
    invoke-virtual {v4, v2}, Landroid/content/pm/ShortcutManager;->enableShortcuts(Ljava/util/List;)V

    .line 241
    .end local v2    # "idsToBeEnabled":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    :cond_5
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p0, p1, v6}, Lcom/vkontakte/android/ShortcutManagerWrapper;->updateShortcuts(Landroid/content/Context;Ljava/util/ArrayList;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method public respondToUserLogout(Landroid/content/Context;)V
    .locals 7
    .param p1, "context"    # Landroid/content/Context;

    .prologue
    .line 183
    :try_start_0
    sget v5, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v6, 0x19

    if-lt v5, v6, :cond_0

    .line 185
    if-nez p1, :cond_1

    .line 210
    :cond_0
    :goto_0
    return-void

    .line 189
    :cond_1
    const-class v5, Landroid/content/pm/ShortcutManager;

    invoke-virtual {p1, v5}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/pm/ShortcutManager;

    .line 190
    .local v3, "shortcutManager":Landroid/content/pm/ShortcutManager;
    invoke-virtual {v3}, Landroid/content/pm/ShortcutManager;->removeAllDynamicShortcuts()V

    .line 191
    iget-object v5, p0, Lcom/vkontakte/android/ShortcutManagerWrapper;->lastPeerIdsUsedForShortcuts:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V

    .line 194
    invoke-virtual {v3}, Landroid/content/pm/ShortcutManager;->getPinnedShortcuts()Ljava/util/List;

    move-result-object v2

    .line 195
    .local v2, "pinnedList":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ShortcutInfo;>;"
    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v5

    if-lez v5, :cond_0

    .line 197
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 199
    .local v1, "pinnedIdsList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_1
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_2

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/content/pm/ShortcutInfo;

    .line 200
    .local v4, "si":Landroid/content/pm/ShortcutInfo;
    invoke-virtual {v4}, Landroid/content/pm/ShortcutInfo;->getId()Ljava/lang/String;

    move-result-object v6

    invoke-interface {v1, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    .line 207
    .end local v1    # "pinnedIdsList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .end local v2    # "pinnedList":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ShortcutInfo;>;"
    .end local v3    # "shortcutManager":Landroid/content/pm/ShortcutManager;
    .end local v4    # "si":Landroid/content/pm/ShortcutInfo;
    :catch_0
    move-exception v0

    .line 208
    .local v0, "e":Ljava/lang/Exception;
    const-string/jumbo v5, "ShortcutManagerWrapper"

    const-string/jumbo v6, "respondToUserLogout failed"

    invoke-static {v5, v6, v0}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 203
    .end local v0    # "e":Ljava/lang/Exception;
    .restart local v1    # "pinnedIdsList":Ljava/util/List;, "Ljava/util/List<Ljava/lang/String;>;"
    .restart local v2    # "pinnedList":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ShortcutInfo;>;"
    .restart local v3    # "shortcutManager":Landroid/content/pm/ShortcutManager;
    :cond_2
    :try_start_1
    invoke-virtual {v3, v1}, Landroid/content/pm/ShortcutManager;->disableShortcuts(Ljava/util/List;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0
.end method

.method public updateShortcuts(Landroid/content/Context;Ljava/util/ArrayList;)V
    .locals 18
    .param p1, "context"    # Landroid/content/Context;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/DialogEntry;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 85
    .local p2, "dialogEntries":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/DialogEntry;>;"
    :try_start_0
    sget v14, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v15, 0x19

    if-lt v14, v15, :cond_0

    .line 87
    const-string/jumbo v14, "ShortcutManagerWrapper"

    const-string/jumbo v15, "updateShortcuts is called"

    invoke-static {v14, v15}, Lcom/vkontakte/android/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    if-eqz p1, :cond_0

    if-nez p2, :cond_1

    .line 177
    :cond_0
    :goto_0
    return-void

    .line 95
    :cond_1
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/ShortcutManagerWrapper;->lastPeerIdsUsedForShortcuts:Ljava/util/ArrayList;

    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v14

    if-lez v14, :cond_5

    .line 96
    const/4 v2, 0x0

    .line 97
    .local v2, "atLeastOneDialogHasBeenChanged":Z
    const/4 v6, 0x0

    .local v6, "i":I
    :goto_1
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/ShortcutManagerWrapper;->lastPeerIdsUsedForShortcuts:Ljava/util/ArrayList;

    invoke-virtual {v14}, Ljava/util/ArrayList;->size()I

    move-result v14

    if-ge v6, v14, :cond_2

    .line 99
    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->size()I

    move-result v14

    if-ge v6, v14, :cond_3

    .line 100
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/ShortcutManagerWrapper;->lastPeerIdsUsedForShortcuts:Ljava/util/ArrayList;

    invoke-virtual {v14, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Ljava/lang/Integer;

    invoke-virtual {v14}, Ljava/lang/Integer;->intValue()I

    move-result v15

    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/vkontakte/android/DialogEntry;

    iget-object v14, v14, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v14, v14, Lcom/vkontakte/android/UserProfile;->uid:I

    if-eq v15, v14, :cond_4

    .line 101
    const/4 v2, 0x1

    .line 111
    :cond_2
    :goto_2
    if-nez v2, :cond_5

    .line 112
    const-string/jumbo v14, "ShortcutManagerWrapper"

    const-string/jumbo v15, "updateShortcuts detected no changes, exiting"

    invoke-static {v14, v15}, Lcom/vkontakte/android/Log;->v(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 174
    .end local v2    # "atLeastOneDialogHasBeenChanged":Z
    .end local v6    # "i":I
    :catch_0
    move-exception v5

    .line 175
    .local v5, "e":Ljava/lang/Exception;
    const-string/jumbo v14, "ShortcutManagerWrapper"

    const-string/jumbo v15, "updateShortcuts failed"

    invoke-static {v14, v15, v5}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_0

    .line 106
    .end local v5    # "e":Ljava/lang/Exception;
    .restart local v2    # "atLeastOneDialogHasBeenChanged":Z
    .restart local v6    # "i":I
    :cond_3
    const/4 v2, 0x1

    .line 107
    goto :goto_2

    .line 97
    :cond_4
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 118
    .end local v2    # "atLeastOneDialogHasBeenChanged":Z
    .end local v6    # "i":I
    :cond_5
    :try_start_1
    const-string/jumbo v14, "ShortcutManagerWrapper"

    const-string/jumbo v15, "updateShortcuts detected some changes, updating"

    invoke-static {v14, v15}, Lcom/vkontakte/android/Log;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    const-class v14, Landroid/content/pm/ShortcutManager;

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Landroid/content/pm/ShortcutManager;

    .line 125
    .local v11, "shortcutManager":Landroid/content/pm/ShortcutManager;
    new-instance v10, Ljava/util/ArrayList;

    invoke-direct {v10}, Ljava/util/ArrayList;-><init>()V

    .line 127
    .local v10, "shortcutList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Landroid/content/pm/ShortcutInfo;>;"
    const/4 v3, 0x0

    .line 128
    .local v3, "createdCount":I
    invoke-direct/range {p0 .. p1}, Lcom/vkontakte/android/ShortcutManagerWrapper;->createShortcutForNewStory(Landroid/content/Context;)Landroid/content/pm/ShortcutInfo;

    move-result-object v14

    invoke-virtual {v10, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 129
    add-int/lit8 v3, v3, 0x1

    .line 131
    invoke-direct/range {p0 .. p1}, Lcom/vkontakte/android/ShortcutManagerWrapper;->createShortcutForNewPost(Landroid/content/Context;)Landroid/content/pm/ShortcutInfo;

    move-result-object v14

    invoke-virtual {v10, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 132
    add-int/lit8 v3, v3, 0x1

    .line 134
    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 135
    .local v7, "peerIds":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/Integer;>;"
    const/4 v6, 0x0

    .restart local v6    # "i":I
    :goto_3
    invoke-virtual {v11}, Landroid/content/pm/ShortcutManager;->getMaxShortcutCountPerActivity()I

    move-result v14

    add-int/lit8 v14, v14, -0x2

    if-ge v6, v14, :cond_6

    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->size()I

    move-result v14

    if-ge v6, v14, :cond_6

    .line 136
    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/vkontakte/android/DialogEntry;

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v14}, Lcom/vkontakte/android/ShortcutManagerWrapper;->createShortcutForDialogEntry(Landroid/content/Context;Lcom/vkontakte/android/DialogEntry;)Landroid/content/pm/ShortcutInfo;

    move-result-object v14

    invoke-virtual {v10, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 137
    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/vkontakte/android/DialogEntry;

    iget-object v14, v14, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v14, v14, Lcom/vkontakte/android/UserProfile;->uid:I

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v7, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 135
    add-int/lit8 v6, v6, 0x1

    goto :goto_3

    .line 140
    :cond_6
    invoke-virtual {v11, v10}, Landroid/content/pm/ShortcutManager;->setDynamicShortcuts(Ljava/util/List;)Z

    .line 142
    move-object/from16 v0, p0

    iput-object v7, v0, Lcom/vkontakte/android/ShortcutManagerWrapper;->lastPeerIdsUsedForShortcuts:Ljava/util/ArrayList;

    .line 146
    invoke-virtual {v11}, Landroid/content/pm/ShortcutManager;->getPinnedShortcuts()Ljava/util/List;

    move-result-object v8

    .line 148
    .local v8, "pinnedList":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ShortcutInfo;>;"
    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 150
    .local v9, "pinnedShortcutsToBeUpdated":Ljava/util/List;, "Ljava/util/List<Landroid/content/pm/ShortcutInfo;>;"
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v14

    if-lez v14, :cond_a

    .line 151
    invoke-interface {v8}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :cond_7
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_a

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Landroid/content/pm/ShortcutInfo;

    .line 152
    .local v13, "si":Landroid/content/pm/ShortcutInfo;
    invoke-virtual {v13}, Landroid/content/pm/ShortcutInfo;->getId()Ljava/lang/String;

    move-result-object v15

    move-object/from16 v0, p0

    invoke-direct {v0, v15}, Lcom/vkontakte/android/ShortcutManagerWrapper;->getDialogPeerId(Ljava/lang/String;)I

    move-result v12

    .line 153
    .local v12, "shortcutPeerId":I
    if-eqz v12, :cond_7

    .line 155
    const/4 v6, 0x0

    :goto_4
    const/16 v15, 0x1e

    if-ge v6, v15, :cond_7

    invoke-virtual/range {p2 .. p2}, Ljava/util/ArrayList;->size()I

    move-result v15

    if-ge v6, v15, :cond_7

    .line 156
    move-object/from16 v0, p2

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/vkontakte/android/DialogEntry;

    .line 157
    .local v4, "di":Lcom/vkontakte/android/DialogEntry;
    iget-object v15, v4, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v15, v15, Lcom/vkontakte/android/UserProfile;->uid:I

    if-ne v15, v12, :cond_9

    .line 158
    iget-object v15, v4, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v15, v15, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-virtual {v13}, Landroid/content/pm/ShortcutInfo;->getLongLabel()Ljava/lang/CharSequence;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-eqz v15, :cond_8

    .line 159
    invoke-virtual {v13}, Landroid/content/pm/ShortcutInfo;->getExtras()Landroid/os/PersistableBundle;

    move-result-object v15

    if-eqz v15, :cond_9

    iget-object v15, v4, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v15, v15, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v13}, Landroid/content/pm/ShortcutInfo;->getExtras()Landroid/os/PersistableBundle;

    move-result-object v16

    const-string/jumbo v17, "ExtraPhotoKey"

    invoke-virtual/range {v16 .. v17}, Landroid/os/PersistableBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    invoke-virtual/range {v15 .. v16}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    if-nez v15, :cond_9

    .line 161
    :cond_8
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-direct {v0, v1, v4}, Lcom/vkontakte/android/ShortcutManagerWrapper;->createShortcutForDialogEntry(Landroid/content/Context;Lcom/vkontakte/android/DialogEntry;)Landroid/content/pm/ShortcutInfo;

    move-result-object v15

    invoke-interface {v9, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 155
    :cond_9
    add-int/lit8 v6, v6, 0x1

    goto :goto_4

    .line 169
    .end local v4    # "di":Lcom/vkontakte/android/DialogEntry;
    .end local v12    # "shortcutPeerId":I
    .end local v13    # "si":Landroid/content/pm/ShortcutInfo;
    :cond_a
    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result v14

    if-lez v14, :cond_0

    .line 170
    invoke-virtual {v11, v9}, Landroid/content/pm/ShortcutManager;->updateShortcuts(Ljava/util/List;)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto/16 :goto_0
.end method
