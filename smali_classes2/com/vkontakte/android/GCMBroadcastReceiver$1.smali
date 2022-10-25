.class Lcom/vkontakte/android/GCMBroadcastReceiver$1;
.super Lcom/vkontakte/android/api/SimpleCallback;
.source "GCMBroadcastReceiver.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/GCMBroadcastReceiver;->lambda$onReceive$11(Landroid/content/Intent;Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/api/SimpleCallback",
        "<[",
        "Lcom/vkontakte/android/NewsEntry;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/GCMBroadcastReceiver;

.field final synthetic val$context:Landroid/content/Context;

.field final synthetic val$extras:Landroid/os/Bundle;

.field final synthetic val$noSound:Z


# direct methods
.method constructor <init>(Lcom/vkontakte/android/GCMBroadcastReceiver;Landroid/content/Context;Landroid/os/Bundle;Z)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/GCMBroadcastReceiver;

    .prologue
    .line 312
    iput-object p1, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$1;->this$0:Lcom/vkontakte/android/GCMBroadcastReceiver;

    iput-object p2, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$1;->val$context:Landroid/content/Context;

    iput-object p3, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$1;->val$extras:Landroid/os/Bundle;

    iput-boolean p4, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$1;->val$noSound:Z

    invoke-direct {p0}, Lcom/vkontakte/android/api/SimpleCallback;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic success(Ljava/lang/Object;)V
    .locals 0

    .prologue
    .line 312
    check-cast p1, [Lcom/vkontakte/android/NewsEntry;

    invoke-virtual {p0, p1}, Lcom/vkontakte/android/GCMBroadcastReceiver$1;->success([Lcom/vkontakte/android/NewsEntry;)V

    return-void
.end method

.method public success([Lcom/vkontakte/android/NewsEntry;)V
    .locals 12
    .param p1, "result"    # [Lcom/vkontakte/android/NewsEntry;

    .prologue
    .line 315
    array-length v6, p1

    const/4 v7, 0x1

    if-ge v6, v7, :cond_0

    .line 344
    :goto_0
    return-void

    .line 318
    :cond_0
    const/4 v6, 0x0

    aget-object v1, p1, v6

    .line 319
    .local v1, "e":Lcom/vkontakte/android/NewsEntry;
    iget-object v6, v1, Lcom/vkontakte/android/NewsEntry;->text:Ljava/lang/String;

    invoke-static {v6}, Lcom/vkontakte/android/Global;->replaceEmojiModifiers(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lcom/vkontakte/android/LinkParser;->stripMentions(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    iget-object v7, v1, Lcom/vkontakte/android/NewsEntry;->attachments:Ljava/util/ArrayList;

    invoke-static {v6, v7}, Lcom/vkontakte/android/attachments/Attachment;->appendLocalizedDescription(Ljava/lang/String;Ljava/util/List;)Ljava/lang/String;

    move-result-object v5

    .line 320
    .local v5, "text":Ljava/lang/String;
    iget-object v6, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$1;->val$context:Landroid/content/Context;

    invoke-static {v6}, Lcom/vkontakte/android/LinkRedirActivity;->createIntentForNotification(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v2

    .line 321
    .local v2, "intent":Landroid/content/Intent;
    const-string/jumbo v6, "sadfdsavcxbxcbv"

    invoke-virtual {v2, v6}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    .line 322
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v7, "vkontakte://vk.com/"

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    iget-object v7, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$1;->val$extras:Landroid/os/Bundle;

    const-string/jumbo v8, "place"

    invoke-virtual {v7, v8}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 323
    const/high16 v6, 0x10000000

    invoke-virtual {v2, v6}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 324
    iget-object v6, v1, Lcom/vkontakte/android/NewsEntry;->userPhotoURL:Ljava/lang/String;

    invoke-static {v6}, Lcom/vk/imageloader/VKImageLoader;->getCircleBitmap(Ljava/lang/String;)Lio/reactivex/Observable;

    move-result-object v6

    invoke-static {v6}, Lcom/vk/core/util/RxUtil;->blockingGetWithNull(Lio/reactivex/Observable;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/graphics/Bitmap;

    .line 325
    .local v4, "photo":Landroid/graphics/Bitmap;
    new-instance v6, Landroid/app/Notification$Builder;

    iget-object v7, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$1;->val$context:Landroid/content/Context;

    invoke-direct {v6, v7}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;)V

    iget v7, v1, Lcom/vkontakte/android/NewsEntry;->time:I

    int-to-long v8, v7

    const-wide/16 v10, 0x3e8

    mul-long/2addr v8, v10

    .line 326
    invoke-virtual {v6, v8, v9}, Landroid/app/Notification$Builder;->setWhen(J)Landroid/app/Notification$Builder;

    move-result-object v6

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v8, v1, Lcom/vkontakte/android/NewsEntry;->userName:Ljava/lang/String;

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    const-string/jumbo v8, " "

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    iget-object v8, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$1;->val$context:Landroid/content/Context;

    const v9, 0x7f080156

    .line 327
    invoke-virtual {v8, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v7, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v6

    iget-object v7, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$1;->val$context:Landroid/content/Context;

    const/4 v8, 0x0

    const/high16 v9, 0x10000000

    .line 328
    invoke-static {v7, v8, v2, v9}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v6

    .line 329
    invoke-virtual {v6, v5}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v6

    if-eqz v4, :cond_1

    .line 330
    .end local v4    # "photo":Landroid/graphics/Bitmap;
    :goto_1
    const/high16 v7, 0x42800000    # 64.0f

    invoke-static {v7}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v7

    const/high16 v8, 0x42800000    # 64.0f

    invoke-static {v8}, Lcom/vkontakte/android/Global;->scale(F)I

    move-result v8

    const/4 v9, 0x1

    invoke-static {v4, v7, v8, v9}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v7

    invoke-virtual {v6, v7}, Landroid/app/Notification$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/app/Notification$Builder;

    move-result-object v6

    const v7, 0x7f0202a1

    .line 331
    invoke-virtual {v6, v7}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v0

    .line 333
    .local v0, "bldr":Landroid/app/Notification$Builder;
    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x10

    if-lt v6, v7, :cond_2

    .line 334
    new-instance v6, Landroid/app/Notification$BigTextStyle;

    invoke-direct {v6, v0}, Landroid/app/Notification$BigTextStyle;-><init>(Landroid/app/Notification$Builder;)V

    .line 335
    invoke-virtual {v6, v5}, Landroid/app/Notification$BigTextStyle;->bigText(Ljava/lang/CharSequence;)Landroid/app/Notification$BigTextStyle;

    move-result-object v6

    invoke-virtual {v6}, Landroid/app/Notification$BigTextStyle;->build()Landroid/app/Notification;

    move-result-object v3

    .line 339
    .local v3, "ntf":Landroid/app/Notification;
    :goto_2
    iget v6, v3, Landroid/app/Notification;->flags:I

    or-int/lit8 v6, v6, 0x10

    iput v6, v3, Landroid/app/Notification;->flags:I

    .line 340
    iget-object v6, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$1;->val$context:Landroid/content/Context;

    sget-object v7, Lcom/vkontakte/android/NotificationUtils$Type;->Posts:Lcom/vkontakte/android/NotificationUtils$Type;

    const/4 v8, 0x1

    invoke-static {v6, v3, v7, v8}, Lcom/vkontakte/android/NotificationUtils;->applySettings(Landroid/content/Context;Landroid/app/Notification;Lcom/vkontakte/android/NotificationUtils$Type;Z)V

    .line 341
    iget-object v6, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$1;->val$context:Landroid/content/Context;

    const/16 v7, 0x1fb

    iget-boolean v8, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$1;->val$noSound:Z

    invoke-static {v6, v7, v3, v8}, Lcom/vkontakte/android/GCMBroadcastReceiver;->access$000(Landroid/content/Context;ILandroid/app/Notification;Z)V

    .line 343
    invoke-static {}, Lcom/vkontakte/android/LongPollService;->updateCounters()V

    goto/16 :goto_0

    .line 329
    .end local v0    # "bldr":Landroid/app/Notification$Builder;
    .end local v3    # "ntf":Landroid/app/Notification;
    .restart local v4    # "photo":Landroid/graphics/Bitmap;
    :cond_1
    iget-object v7, p0, Lcom/vkontakte/android/GCMBroadcastReceiver$1;->val$context:Landroid/content/Context;

    .line 330
    invoke-virtual {v7}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v7

    const v8, 0x7f0203d3

    invoke-static {v7, v8}, Lcom/vkontakte/android/Global;->getResBitmap(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    move-result-object v4

    goto :goto_1

    .line 337
    .end local v4    # "photo":Landroid/graphics/Bitmap;
    .restart local v0    # "bldr":Landroid/app/Notification$Builder;
    :cond_2
    invoke-virtual {v0}, Landroid/app/Notification$Builder;->getNotification()Landroid/app/Notification;

    move-result-object v3

    .restart local v3    # "ntf":Landroid/app/Notification;
    goto :goto_2
.end method
