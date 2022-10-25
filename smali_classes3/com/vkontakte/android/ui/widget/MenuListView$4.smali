.class Lcom/vkontakte/android/ui/widget/MenuListView$4;
.super Ljava/lang/Object;
.source "MenuListView.java"

# interfaces
.implements Lcom/vkontakte/android/ui/widget/MenuListView$Listener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/ui/widget/MenuListView;->init()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/ui/widget/MenuListView;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/ui/widget/MenuListView;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/ui/widget/MenuListView;

    .prologue
    .line 346
    iput-object p1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$4;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onCommunitySelected(IZ)V
    .locals 3
    .param p1, "id"    # I
    .param p2, "allowBack"    # Z

    .prologue
    .line 444
    if-nez p2, :cond_0

    .line 445
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$4;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->setCurrentItem(I)V

    .line 447
    :cond_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 448
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "id"

    neg-int v2, p1

    invoke-virtual {v0, v1, v2}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 449
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$4;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1000(Lcom/vkontakte/android/ui/widget/MenuListView;)Lcom/vkontakte/android/ui/navigation/NavigationDelegate;

    move-result-object v1

    const-class v2, Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v1, v2, v0, p2}, Lcom/vkontakte/android/ui/navigation/NavigationDelegate;->openFragment(Ljava/lang/Class;Landroid/os/Bundle;Z)V

    .line 450
    return-void
.end method

.method public onMenuItemSelected(IZ)V
    .locals 9
    .param p1, "item"    # I
    .param p2, "allowBack"    # Z

    .prologue
    .line 362
    const/4 v3, 0x0

    .line 363
    .local v3, "fragment":Ljava/lang/Class;, "Ljava/lang/Class<+Landroid/app/Fragment;>;"
    new-instance v1, Landroid/os/Bundle;

    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 364
    .local v1, "args":Landroid/os/Bundle;
    const/4 v5, 0x0

    .line 365
    .local v5, "statKey":Ljava/lang/String;
    sparse-switch p1, :sswitch_data_0

    .line 433
    :goto_0
    if-eqz v5, :cond_0

    .line 434
    const-string/jumbo v6, "user_action"

    invoke-static {v6}, Lcom/vkontakte/android/data/Analytics;->track(Ljava/lang/String;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v6

    const-string/jumbo v7, "action_type"

    const-string/jumbo v8, "menu_click"

    invoke-virtual {v6, v7, v8}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v6

    const-string/jumbo v7, "action_param"

    invoke-virtual {v6, v7, v5}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->addParam(Ljava/lang/String;Ljava/lang/Object;)Lcom/vkontakte/android/data/Analytics$EventBuilder;

    move-result-object v6

    invoke-virtual {v6}, Lcom/vkontakte/android/data/Analytics$EventBuilder;->commit()Lcom/vkontakte/android/data/Analytics$EventBuilder;

    .line 437
    :cond_0
    if-eqz v3, :cond_1

    .line 438
    iget-object v6, p0, Lcom/vkontakte/android/ui/widget/MenuListView$4;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v6}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1000(Lcom/vkontakte/android/ui/widget/MenuListView;)Lcom/vkontakte/android/ui/navigation/NavigationDelegate;

    move-result-object v6

    invoke-virtual {v6, v3, v1, p2}, Lcom/vkontakte/android/ui/navigation/NavigationDelegate;->openFragment(Ljava/lang/Class;Landroid/os/Bundle;Z)V

    .line 440
    :cond_1
    return-void

    .line 367
    :sswitch_0
    const-class v3, Lcom/vkontakte/android/fragments/ProfileFragment;

    .line 368
    const-string/jumbo v6, "id"

    invoke-static {}, Lcom/vkontakte/android/auth/VKAccountManager;->getCurrent()Lcom/vkontakte/android/auth/VKAccount;

    move-result-object v7

    invoke-virtual {v7}, Lcom/vkontakte/android/auth/VKAccount;->getUid()I

    move-result v7

    invoke-virtual {v1, v6, v7}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 369
    const-string/jumbo v5, "profile"

    .line 370
    goto :goto_0

    .line 372
    :sswitch_1
    const-class v3, Lcom/vkontakte/android/fragments/friends/FriendsFragment;

    .line 373
    const-string/jumbo v5, "friends"

    .line 374
    goto :goto_0

    .line 376
    :sswitch_2
    const-class v3, Lcom/vkontakte/android/fragments/PhotosFragment;

    .line 377
    const-string/jumbo v6, "show_friends_feed"

    const/4 v7, 0x0

    invoke-virtual {v1, v6, v7}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 378
    const-string/jumbo v5, "photos"

    .line 379
    goto :goto_0

    .line 381
    :sswitch_3
    const-class v3, Lcom/vkontakte/android/fragments/videos/VideosFragment;

    .line 382
    const-string/jumbo v5, "videos"

    .line 383
    goto :goto_0

    .line 385
    :sswitch_4
    const-class v3, Lcom/vk/music/fragment/MusicFragment;

    .line 386
    const-string/jumbo v5, "audio"

    .line 387
    goto :goto_0

    .line 389
    :sswitch_5
    const-class v3, Lcom/vkontakte/android/fragments/messages/DialogsFragment;

    .line 390
    const-string/jumbo v5, "messages"

    .line 391
    goto :goto_0

    .line 393
    :sswitch_6
    const-class v3, Lcom/vkontakte/android/fragments/groups/GroupsFragment;

    .line 394
    const-string/jumbo v5, "groups"

    .line 395
    goto :goto_0

    .line 397
    :sswitch_7
    iget-object v6, p0, Lcom/vkontakte/android/ui/widget/MenuListView$4;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-virtual {v6}, Lcom/vkontakte/android/ui/widget/MenuListView;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-static {v6}, Lcom/vkontakte/android/utils/Utils;->castToActivity(Landroid/content/Context;)Landroid/app/Activity;

    move-result-object v0

    .line 398
    .local v0, "activity":Landroid/app/Activity;
    const/4 v2, 0x0

    .line 399
    .local v2, "forseUpdate":Z
    if-eqz v0, :cond_2

    .line 400
    invoke-virtual {v0}, Landroid/app/Activity;->getFragmentManager()Landroid/app/FragmentManager;

    move-result-object v6

    const v7, 0x7f10002b

    invoke-virtual {v6, v7}, Landroid/app/FragmentManager;->findFragmentById(I)Landroid/app/Fragment;

    move-result-object v4

    .line 401
    .local v4, "fragmentLocal":Landroid/app/Fragment;
    instance-of v6, v4, Lcom/vkontakte/android/fragments/NewsFragment;

    if-eqz v6, :cond_2

    .line 402
    const/4 v2, 0x1

    .line 405
    .end local v4    # "fragmentLocal":Landroid/app/Fragment;
    :cond_2
    invoke-static {v2}, Lcom/vkontakte/android/fragments/NewsFragment;->resetListIdIfNeed(Z)V

    .line 406
    const-class v3, Lcom/vkontakte/android/fragments/NewsFragment;

    .line 407
    const-string/jumbo v5, "news"

    .line 408
    goto/16 :goto_0

    .line 410
    .end local v0    # "activity":Landroid/app/Activity;
    .end local v2    # "forseUpdate":Z
    :sswitch_8
    const-class v3, Lcom/vkontakte/android/fragments/feedback/FeedbackFragment;

    .line 411
    const-string/jumbo v5, "feedback"

    .line 412
    goto/16 :goto_0

    .line 414
    :sswitch_9
    const-class v3, Lcom/vkontakte/android/fragments/GamesFragment;

    .line 415
    const-string/jumbo v5, "games"

    .line 416
    goto/16 :goto_0

    .line 418
    :sswitch_a
    const-class v3, Lcom/vkontakte/android/fragments/fave/FaveFragment;

    .line 419
    const-string/jumbo v5, "fave"

    .line 420
    goto/16 :goto_0

    .line 422
    :sswitch_b
    const-class v3, Lcom/vkontakte/android/fragments/search/ExtendedSearchFragment;

    .line 423
    const-string/jumbo v5, "search"

    .line 424
    goto/16 :goto_0

    .line 426
    :sswitch_c
    const-class v3, Lcom/vkontakte/android/fragments/SettingsListFragment;

    .line 427
    const-string/jumbo v5, "settings"

    .line 428
    goto/16 :goto_0

    .line 430
    :sswitch_d
    const-class v3, Lcom/vkontakte/android/fragments/gifts/BirthdaysFragment;

    goto/16 :goto_0

    .line 365
    :sswitch_data_0
    .sparse-switch
        -0x77359400 -> :sswitch_d
        0x0 -> :sswitch_0
        0x1 -> :sswitch_7
        0x2 -> :sswitch_8
        0x3 -> :sswitch_5
        0x4 -> :sswitch_1
        0x5 -> :sswitch_6
        0x6 -> :sswitch_2
        0x7 -> :sswitch_3
        0x8 -> :sswitch_4
        0x9 -> :sswitch_9
        0xa -> :sswitch_a
        0xb -> :sswitch_b
        0xc -> :sswitch_c
    .end sparse-switch
.end method

.method public onUserSelected(IZ)V
    .locals 3
    .param p1, "id"    # I
    .param p2, "allowBack"    # Z

    .prologue
    .line 350
    if-nez p2, :cond_0

    .line 351
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$4;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    const/4 v2, -0x1

    invoke-virtual {v1, v2}, Lcom/vkontakte/android/ui/widget/MenuListView;->setCurrentItem(I)V

    .line 353
    :cond_0
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 354
    .local v0, "args":Landroid/os/Bundle;
    const-string/jumbo v1, "id"

    invoke-virtual {v0, v1, p1}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 355
    iget-object v1, p0, Lcom/vkontakte/android/ui/widget/MenuListView$4;->this$0:Lcom/vkontakte/android/ui/widget/MenuListView;

    invoke-static {v1}, Lcom/vkontakte/android/ui/widget/MenuListView;->access$1000(Lcom/vkontakte/android/ui/widget/MenuListView;)Lcom/vkontakte/android/ui/navigation/NavigationDelegate;

    move-result-object v1

    const-class v2, Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v1, v2, v0, p2}, Lcom/vkontakte/android/ui/navigation/NavigationDelegate;->openFragment(Ljava/lang/Class;Landroid/os/Bundle;Z)V

    .line 356
    return-void
.end method
