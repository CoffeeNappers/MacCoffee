.class Lcom/vkontakte/android/fragments/ProfileFragment$4;
.super Ljava/lang/Object;
.source "ProfileFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/ProfileFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/fragments/ProfileFragment;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/fragments/ProfileFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/fragments/ProfileFragment;

    .prologue
    .line 297
    iput-object p1, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method synthetic lambda$onClick$0(Landroid/view/View;Landroid/view/MenuItem;)Z
    .locals 3
    .param p1, "v"    # Landroid/view/View;
    .param p2, "item"    # Landroid/view/MenuItem;

    .prologue
    const/4 v2, 0x1

    .line 358
    invoke-interface {p2}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 384
    :goto_0
    :pswitch_0
    return v2

    .line 360
    :pswitch_1
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$1200(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    goto :goto_0

    .line 363
    :pswitch_2
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$1300(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    goto :goto_0

    .line 366
    :pswitch_3
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    const-string/jumbo v1, ""

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$700(Lcom/vkontakte/android/fragments/ProfileFragment;Ljava/lang/String;)V

    goto :goto_0

    .line 369
    :pswitch_4
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$1000(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    goto :goto_0

    .line 372
    :pswitch_5
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$1100(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V

    goto :goto_0

    .line 375
    :pswitch_6
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0, v2}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$900(Lcom/vkontakte/android/fragments/ProfileFragment;Z)V

    goto :goto_0

    .line 378
    :pswitch_7
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$900(Lcom/vkontakte/android/fragments/ProfileFragment;Z)V

    goto :goto_0

    .line 381
    :pswitch_8
    iget-object v0, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$1400(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    goto :goto_0

    .line 358
    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_8
    .end packed-switch
.end method

.method public onClick(Landroid/view/View;)V
    .locals 11
    .param p1, "v"    # Landroid/view/View;

    .prologue
    const/4 v8, 0x5

    const/4 v6, 0x3

    const/4 v5, 0x2

    const/4 v7, 0x1

    const/4 v10, 0x0

    .line 300
    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 301
    .local v0, "act":Ljava/lang/String;
    const-string/jumbo v3, "message"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 302
    new-instance v3, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;

    iget-object v4, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$100(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v4

    iget-object v5, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v5}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v5

    iget-object v5, v5, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v5, v5, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    invoke-direct {v3, v4, v5}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;-><init>(ILjava/lang/String;)V

    iget-object v4, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v4

    iget-object v4, v4, Lcom/vkontakte/android/api/ExtendedUserProfile;->profile:Lcom/vkontakte/android/UserProfile;

    iget-object v4, v4, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->setPhoto(Ljava/lang/CharSequence;)Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;

    move-result-object v3

    iget-object v4, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v4

    invoke-virtual {v3, v4}, Lcom/vkontakte/android/fragments/messages/ChatFragment$Builder;->go(Landroid/content/Context;)Z

    .line 390
    :cond_0
    :goto_0
    return-void

    .line 303
    :cond_1
    const-string/jumbo v3, "post"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    .line 304
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$500(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    goto :goto_0

    .line 305
    :cond_2
    const-string/jumbo v3, "add"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_3

    .line 306
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$600(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    goto :goto_0

    .line 307
    :cond_3
    const-string/jumbo v3, "accept"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 308
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    const-string/jumbo v4, ""

    invoke-static {v3, v4}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$700(Lcom/vkontakte/android/fragments/ProfileFragment;Ljava/lang/String;)V

    goto :goto_0

    .line 309
    :cond_4
    const-string/jumbo v3, "cancel"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5

    .line 310
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$800(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    goto :goto_0

    .line 311
    :cond_5
    const-string/jumbo v3, "join"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_6

    .line 312
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v3, v7}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$900(Lcom/vkontakte/android/fragments/ProfileFragment;Z)V

    goto :goto_0

    .line 313
    :cond_6
    const-string/jumbo v3, "join_unsure"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_7

    .line 314
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v3, v10}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$900(Lcom/vkontakte/android/fragments/ProfileFragment;Z)V

    goto :goto_0

    .line 315
    :cond_7
    const-string/jumbo v3, "leave"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_8

    .line 316
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$1000(Lcom/vkontakte/android/fragments/ProfileFragment;)V

    goto :goto_0

    .line 317
    :cond_8
    const-string/jumbo v3, "photo"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 318
    new-instance v1, Landroid/content/Intent;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    const-class v4, Lcom/vkontakte/android/PostPhotoActivity;

    invoke-direct {v1, v3, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 319
    .local v1, "intent":Landroid/content/Intent;
    const-string/jumbo v3, "option"

    invoke-virtual {v1, v3, v10}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 320
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v3, v1}, Lcom/vkontakte/android/fragments/ProfileFragment;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_0

    .line 321
    .end local v1    # "intent":Landroid/content/Intent;
    :cond_9
    const-string/jumbo v3, "edit"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_a

    .line 322
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/ProfileFragment;->editProfile()V

    goto/16 :goto_0

    .line 323
    :cond_a
    const-string/jumbo v3, "options"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_18

    .line 324
    new-instance v2, Landroid/widget/PopupMenu;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-virtual {v3}, Lcom/vkontakte/android/fragments/ProfileFragment;->getActivity()Landroid/app/Activity;

    move-result-object v3

    invoke-direct {v2, v3, p1}, Landroid/widget/PopupMenu;-><init>(Landroid/content/Context;Landroid/view/View;)V

    .line 325
    .local v2, "pm":Landroid/widget/PopupMenu;
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$100(Lcom/vkontakte/android/fragments/ProfileFragment;)I

    move-result v3

    if-lez v3, :cond_10

    .line 326
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v3

    iget v3, v3, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    if-ne v3, v6, :cond_d

    .line 327
    invoke-virtual {v2}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v3

    const v4, 0x7f0801dc

    invoke-interface {v3, v10, v10, v10, v4}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 328
    invoke-virtual {v2}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v3

    const v4, 0x7f0801a4

    invoke-interface {v3, v10, v7, v10, v4}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 329
    invoke-virtual {v2}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v4

    const/16 v5, 0xa

    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v3

    iget-boolean v3, v3, Lcom/vkontakte/android/api/ExtendedUserProfile;->isHiddenFromFeed:Z

    if-eqz v3, :cond_c

    const v3, 0x7f080690

    :goto_1
    new-array v7, v7, [Ljava/lang/Object;

    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v8

    iget-object v8, v8, Lcom/vkontakte/android/api/ExtendedUserProfile;->firstNameGen:Ljava/lang/String;

    aput-object v8, v7, v10

    invoke-virtual {v6, v3, v7}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4, v10, v5, v10, v3}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    .line 357
    :cond_b
    :goto_2
    invoke-static {p0, p1}, Lcom/vkontakte/android/fragments/ProfileFragment$4$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/ProfileFragment$4;Landroid/view/View;)Landroid/widget/PopupMenu$OnMenuItemClickListener;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/widget/PopupMenu;->setOnMenuItemClickListener(Landroid/widget/PopupMenu$OnMenuItemClickListener;)V

    .line 386
    invoke-virtual {v2}, Landroid/widget/PopupMenu;->show()V

    goto/16 :goto_0

    .line 329
    :cond_c
    const v3, 0x7f08030b

    goto :goto_1

    .line 330
    :cond_d
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v3

    iget v3, v3, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    if-ne v3, v7, :cond_f

    .line 331
    invoke-virtual {v2}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v3

    const v4, 0x7f080556

    invoke-interface {v3, v10, v7, v10, v4}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 332
    invoke-virtual {v2}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v4

    const/16 v5, 0xa

    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v3

    iget-boolean v3, v3, Lcom/vkontakte/android/api/ExtendedUserProfile;->isHiddenFromFeed:Z

    if-eqz v3, :cond_e

    const v3, 0x7f080690

    :goto_3
    new-array v7, v7, [Ljava/lang/Object;

    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v8}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v8

    iget-object v8, v8, Lcom/vkontakte/android/api/ExtendedUserProfile;->firstNameGen:Ljava/lang/String;

    aput-object v8, v7, v10

    invoke-virtual {v6, v3, v7}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4, v10, v5, v10, v3}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    goto :goto_2

    :cond_e
    const v3, 0x7f08030b

    goto :goto_3

    .line 333
    :cond_f
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v3

    iget v3, v3, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    if-ne v3, v5, :cond_b

    .line 334
    invoke-virtual {v2}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v3

    const v4, 0x7f08023c

    invoke-interface {v3, v10, v5, v10, v4}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 335
    invoke-virtual {v2}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v3

    const v4, 0x7f08023d

    invoke-interface {v3, v10, v7, v10, v4}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    goto :goto_2

    .line 338
    :cond_10
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v3

    iget v3, v3, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    if-eq v3, v7, :cond_11

    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v3

    iget v3, v3, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    if-ne v3, v5, :cond_15

    .line 339
    :cond_11
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v3

    iget v3, v3, Lcom/vkontakte/android/api/ExtendedUserProfile;->groupType:I

    if-ne v3, v7, :cond_12

    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v3

    iget v3, v3, Lcom/vkontakte/android/api/ExtendedUserProfile;->eventStartTime:I

    invoke-static {}, Lcom/vkontakte/android/TimeUtils;->getCurrentTime()I

    move-result v4

    if-le v3, v4, :cond_12

    .line 340
    invoke-virtual {v2}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v3

    const/4 v4, 0x4

    const v5, 0x7f080203

    invoke-interface {v3, v10, v4, v10, v5}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 344
    :goto_4
    invoke-virtual {v2}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v4

    const/16 v5, 0xa

    iget-object v6, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v3

    iget-boolean v3, v3, Lcom/vkontakte/android/api/ExtendedUserProfile;->isHiddenFromFeed:Z

    if-eqz v3, :cond_14

    const v3, 0x7f080690

    :goto_5
    new-array v7, v7, [Ljava/lang/Object;

    iget-object v8, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    const v9, 0x7f0802ed

    invoke-virtual {v8, v9}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I)Ljava/lang/String;

    move-result-object v8

    aput-object v8, v7, v10

    invoke-virtual {v6, v3, v7}, Lcom/vkontakte/android/fragments/ProfileFragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v4, v10, v5, v10, v3}, Landroid/view/Menu;->add(IIILjava/lang/CharSequence;)Landroid/view/MenuItem;

    goto/16 :goto_2

    .line 342
    :cond_12
    invoke-virtual {v2}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v4

    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v3

    iget v3, v3, Lcom/vkontakte/android/api/ExtendedUserProfile;->groupType:I

    if-eq v3, v5, :cond_13

    const v3, 0x7f08032c

    :goto_6
    invoke-interface {v4, v10, v6, v10, v3}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    goto :goto_4

    :cond_13
    const v3, 0x7f080584

    goto :goto_6

    .line 344
    :cond_14
    const v3, 0x7f08030b

    goto :goto_5

    .line 345
    :cond_15
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v3

    iget v3, v3, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    const/4 v4, 0x4

    if-ne v3, v4, :cond_16

    .line 346
    invoke-virtual {v2}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v3

    const v4, 0x7f080556

    invoke-interface {v3, v10, v6, v10, v4}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    goto/16 :goto_2

    .line 347
    :cond_16
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v3

    iget v3, v3, Lcom/vkontakte/android/api/ExtendedUserProfile;->friendStatus:I

    if-ne v3, v8, :cond_b

    .line 348
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v3}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$000(Lcom/vkontakte/android/fragments/ProfileFragment;)Lcom/vkontakte/android/api/ExtendedUserProfile;

    move-result-object v3

    iget v3, v3, Lcom/vkontakte/android/api/ExtendedUserProfile;->groupType:I

    if-ne v3, v7, :cond_17

    .line 349
    invoke-virtual {v2}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v3

    const v4, 0x7f0802c3

    invoke-interface {v3, v10, v8, v10, v4}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 350
    invoke-virtual {v2}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v3

    const/4 v4, 0x6

    const v5, 0x7f0802c4

    invoke-interface {v3, v10, v4, v10, v5}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    .line 354
    :goto_7
    invoke-virtual {v2}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v3

    const v4, 0x7f0802cc

    invoke-interface {v3, v10, v6, v10, v4}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    goto/16 :goto_2

    .line 352
    :cond_17
    invoke-virtual {v2}, Landroid/widget/PopupMenu;->getMenu()Landroid/view/Menu;

    move-result-object v3

    const v4, 0x7f0802cb

    invoke-interface {v3, v10, v8, v10, v4}, Landroid/view/Menu;->add(IIII)Landroid/view/MenuItem;

    goto :goto_7

    .line 387
    .end local v2    # "pm":Landroid/widget/PopupMenu;
    :cond_18
    const-string/jumbo v3, "event_options"

    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 388
    iget-object v3, p0, Lcom/vkontakte/android/fragments/ProfileFragment$4;->this$0:Lcom/vkontakte/android/fragments/ProfileFragment;

    invoke-static {v3, p1}, Lcom/vkontakte/android/fragments/ProfileFragment;->access$1100(Lcom/vkontakte/android/fragments/ProfileFragment;Landroid/view/View;)V

    goto/16 :goto_0
.end method
