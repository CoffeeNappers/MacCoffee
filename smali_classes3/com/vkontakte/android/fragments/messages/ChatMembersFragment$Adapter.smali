.class Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;
.super Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;
.source "ChatMembersFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "Adapter"
.end annotation


# static fields
.field public static final TYPE_BG:I = 0x1

.field public static final TYPE_BUTTON_ADD_USER_TO_CHAT:I = 0x4

.field public static final TYPE_BUTTON_LEAVE_CHAT:I = 0x5

.field public static final TYPE_BUTTON_RETURN_CHAT:I = 0x6

.field public static final TYPE_CHAT_INFO:I = 0x8

.field public static final TYPE_CHAT_NEW:I = 0x7

.field public static final TYPE_CHECK_BOX_PREF:I = 0x2

.field public static final TYPE_MESSAGE_ATTACHMENTS:I = 0xa

.field public static final TYPE_REMOVABLE_CHAT_USER:I = 0x9

.field public static final TYPE_SUMMARY_PREFS:I = 0x3

.field public static final TYPE_TITLE:I


# instance fields
.field addUserToChat:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

.field chatInfo:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

.field chatUsers:Ljava/util/ArrayList;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/ChatUser;",
            ">;"
        }
    .end annotation
.end field

.field dnd:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

.field leaveButton:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

.field messageAttachments:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

.field notificationTitle:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

.field paddingBottom:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

.field returnButton:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

.field soundChat:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

.field final synthetic this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

.field usersList:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;",
            ">;"
        }
    .end annotation
.end field

.field usersTitle:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;


# direct methods
.method private constructor <init>(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;)V
    .locals 5

    .prologue
    const/4 v4, 0x0

    .line 552
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-direct {p0}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter;-><init>()V

    .line 566
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->chatUsers:Ljava/util/ArrayList;

    .line 571
    const/16 v0, 0xa

    new-instance v1, Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder$IconPrefInfo;

    const v2, 0x7f020209

    const v3, 0x7f08012a

    .line 572
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder$IconPrefInfo;-><init>(ILjava/lang/Object;)V

    .line 571
    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->topBottom(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->messageAttachments:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    .line 574
    const v0, 0x7f08063a

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v4, v0}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->top(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->notificationTitle:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    .line 575
    const/4 v0, 0x2

    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->access$800(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;)Lcom/vkontakte/android/ui/holder/commons/PreferenceCheckBoxHolder$Ref;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->soundChat:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    .line 576
    const/4 v0, 0x3

    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->access$900(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;)Lcom/vkontakte/android/ui/holder/commons/PreferenceSummaryHolder$Ref;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->dnd:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    .line 578
    const v0, 0x7f080131

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-static {v4, v0}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->top(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->usersTitle:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    .line 579
    const/4 v0, 0x4

    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->addUserToChat:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    .line 580
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->usersList:Ljava/util/ArrayList;

    .line 582
    const/4 v0, 0x5

    const v1, 0x7f08012f

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->topBottom(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->leaveButton:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    .line 584
    const/4 v0, 0x6

    const v1, 0x7f0805d7

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->topBottom(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->returnButton:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    .line 586
    const/4 v0, 0x1

    const v1, 0x7f02005d

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->bottom(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->paddingBottom:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    return-void
.end method

.method synthetic constructor <init>(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$1;)V
    .locals 0
    .param p1, "x0"    # Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;
    .param p2, "x1"    # Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$1;

    .prologue
    .line 552
    invoke-direct {p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;-><init>(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;)V

    return-void
.end method


# virtual methods
.method public addChatUser(Lcom/vkontakte/android/ChatUser;)V
    .locals 2
    .param p1, "chatUser"    # Lcom/vkontakte/android/ChatUser;

    .prologue
    .line 667
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-static {v0}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->access$1100(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;)I

    move-result v0

    iput v0, p1, Lcom/vkontakte/android/ChatUser;->admin:I

    .line 668
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->chatUsers:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 669
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->usersList:Ljava/util/ArrayList;

    const/16 v1, 0x9

    invoke-static {v1, p1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 670
    return-void
.end method

.method public build()V
    .locals 4

    .prologue
    const v3, 0x7f0200e6

    const/4 v2, 0x1

    .line 685
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 687
    .local v0, "dataList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;>;"
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->access$1200(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 688
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->top(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 692
    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->chatInfo:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 694
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->access$1300(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->access$1000(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 695
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->notificationTitle:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 696
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->soundChat:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 697
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->dnd:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 698
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->paddingBottom:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 700
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->access$1000(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 701
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->messageAttachments:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 703
    :cond_1
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->access$1300(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 704
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->usersTitle:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 706
    :cond_2
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->access$1300(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;)Z

    move-result v1

    if-nez v1, :cond_3

    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->access$1000(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 707
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->addUserToChat:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 709
    :cond_3
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->access$1300(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;)Z

    move-result v1

    if-nez v1, :cond_4

    .line 710
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->usersList:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    .line 711
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->paddingBottom:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 713
    :cond_4
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->access$1300(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;)Z

    move-result v1

    if-nez v1, :cond_5

    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->access$1000(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 714
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->leaveButton:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 716
    :cond_5
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->access$1300(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;)Z

    move-result v1

    if-eqz v1, :cond_6

    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->access$1000(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;)Z

    move-result v1

    if-nez v1, :cond_6

    .line 717
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->returnButton:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 720
    :cond_6
    invoke-virtual {p0, v0}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->setData(Ljava/util/List;)V

    .line 721
    return-void

    .line 690
    :cond_7
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-static {v2, v1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto/16 :goto_0
.end method

.method public getImageCountForItem(I)I
    .locals 2
    .param p1, "position"    # I

    .prologue
    .line 642
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->data:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    iget v0, v0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->type:I

    const/16 v1, 0x9

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method public getImageURL(II)Ljava/lang/String;
    .locals 2
    .param p1, "position"    # I
    .param p2, "image"    # I

    .prologue
    .line 647
    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->data:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    iget v0, v0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->type:I

    const/16 v1, 0x9

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->data:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    iget-object v0, v0, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->object:Ljava/lang/Object;

    invoke-static {v0}, Lcom/vkontakte/android/ui/holder/messages/RemovableChatUserViewHolder;->getImageUrl(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :goto_0
    return-object v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method synthetic lambda$onCreateViewHolder$0(Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder$IconPrefInfo;)V
    .locals 2
    .param p1, "v"    # Lcom/vkontakte/android/ui/holder/commons/PreferenceIconItemHolder$IconPrefInfo;

    .prologue
    .line 630
    new-instance v0, Lcom/vkontakte/android/fragments/messages/ChatAttachmentHistoryFragment$Builder;

    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->getPeerID()I

    move-result v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/fragments/messages/ChatAttachmentHistoryFragment$Builder;-><init>(I)V

    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-virtual {v1}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->getActivity()Landroid/app/Activity;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/vkontakte/android/fragments/messages/ChatAttachmentHistoryFragment$Builder;->go(Landroid/content/Context;)Z

    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$ViewHolder;
    .locals 1

    .prologue
    .line 552
    invoke-virtual {p0, p1, p2}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/RecyclerHolder;

    move-result-object v0

    return-object v0
.end method

.method public onCreateViewHolder(Landroid/view/ViewGroup;I)Lcom/vkontakte/android/ui/holder/RecyclerHolder;
    .locals 3
    .param p1, "parent"    # Landroid/view/ViewGroup;
    .param p2, "viewType"    # I

    .prologue
    .line 594
    packed-switch p2, :pswitch_data_0

    .line 597
    invoke-static {p1}, Lcom/vkontakte/android/ui/holder/commons/TitleHolder;->darkGrayTitle(Landroid/view/ViewGroup;)Lcom/vkontakte/android/ui/holder/commons/TitleHolder;

    move-result-object v0

    .line 629
    :goto_0
    return-object v0

    .line 599
    :pswitch_0
    new-instance v0, Lcom/vkontakte/android/ui/holder/commons/BackgroundHolder;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/ui/holder/commons/BackgroundHolder;-><init>(Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 601
    :pswitch_1
    new-instance v0, Lcom/vkontakte/android/ui/holder/commons/PreferenceCheckBoxHolder;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/ui/holder/commons/PreferenceCheckBoxHolder;-><init>(Landroid/content/Context;)V

    goto :goto_0

    .line 603
    :pswitch_2
    new-instance v0, Lcom/vkontakte/android/ui/holder/commons/PreferenceSummaryHolder;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/ui/holder/commons/PreferenceSummaryHolder;-><init>(Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 605
    :pswitch_3
    new-instance v0, Lcom/vkontakte/android/ui/holder/messages/AddUserToChatHolder;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/ui/holder/messages/AddUserToChatHolder;-><init>(Landroid/content/Context;)V

    goto :goto_0

    .line 607
    :pswitch_4
    new-instance v0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter$1;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter$1;-><init>(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 614
    :pswitch_5
    new-instance v0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter$2;

    invoke-direct {v0, p0, p1}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter$2;-><init>(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;Landroid/view/ViewGroup;)V

    goto :goto_0

    .line 621
    :pswitch_6
    new-instance v0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;-><init>(Landroid/content/Context;Z)V

    goto :goto_0

    .line 623
    :pswitch_7
    new-instance v0, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder;-><init>(Landroid/content/Context;Z)V

    goto :goto_0

    .line 625
    :pswitch_8
    new-instance v0, Lcom/vkontakte/android/ui/holder/messages/RemovableChatUserViewHolder;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vkontakte/android/ui/holder/messages/RemovableChatUserViewHolder;-><init>(Landroid/content/Context;)V

    .line 626
    .local v0, "holder":Lcom/vkontakte/android/ui/holder/messages/RemovableChatUserViewHolder;
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-static {v2}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->access$1000(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;)Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Lcom/vkontakte/android/ui/holder/messages/RemovableChatUserViewHolder;->setOnClickListenerAndIsCreate(Landroid/view/View$OnClickListener;Z)V

    goto :goto_0

    .line 629
    .end local v0    # "holder":Lcom/vkontakte/android/ui/holder/messages/RemovableChatUserViewHolder;
    :pswitch_9
    new-instance v0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter$3;

    invoke-static {p0}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter$$Lambda$1;->lambdaFactory$(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;)Lcom/vkontakte/android/functions/VoidF1;

    move-result-object v1

    invoke-direct {v0, p0, p1, v1}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter$3;-><init>(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;Landroid/view/ViewGroup;Lcom/vkontakte/android/functions/VoidF1;)V

    goto :goto_0

    .line 594
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
        :pswitch_3
        :pswitch_4
        :pswitch_5
        :pswitch_6
        :pswitch_7
        :pswitch_8
        :pswitch_9
    .end packed-switch
.end method

.method public removeChatUser(I)V
    .locals 3
    .param p1, "uid"    # I

    .prologue
    .line 651
    const/4 v1, -0x1

    .line 652
    .local v1, "index":I
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_0
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->chatUsers:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v0, v2, :cond_0

    .line 653
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->chatUsers:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/vkontakte/android/ChatUser;

    iget-object v2, v2, Lcom/vkontakte/android/ChatUser;->user:Lcom/vkontakte/android/UserProfile;

    iget v2, v2, Lcom/vkontakte/android/UserProfile;->uid:I

    if-ne v2, p1, :cond_2

    .line 654
    move v1, v0

    .line 658
    :cond_0
    if-ltz v1, :cond_1

    .line 659
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->chatUsers:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 660
    iget-object v2, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->usersList:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 662
    invoke-virtual {p0}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->build()V

    .line 664
    :cond_1
    return-void

    .line 652
    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0
.end method

.method public replaceChatUsers(Ljava/util/ArrayList;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList",
            "<",
            "Lcom/vkontakte/android/ChatUser;",
            ">;)V"
        }
    .end annotation

    .prologue
    .line 673
    .local p1, "chatUsers":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ChatUser;>;"
    iput-object p1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->chatUsers:Ljava/util/ArrayList;

    .line 674
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 675
    .local v3, "usersList":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;>;"
    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v2

    .line 676
    .local v2, "size":I
    const/4 v1, 0x0

    .local v1, "i":I
    :goto_0
    if-ge v1, v2, :cond_0

    .line 677
    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/vkontakte/android/ChatUser;

    .line 678
    .local v0, "chatUser":Lcom/vkontakte/android/ChatUser;
    iget-object v4, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-static {v4}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->access$1100(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;)I

    move-result v4

    iput v4, v0, Lcom/vkontakte/android/ChatUser;->admin:I

    .line 679
    const/16 v4, 0x9

    invoke-static {v4, v0}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->middle(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 676
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 681
    .end local v0    # "chatUser":Lcom/vkontakte/android/ChatUser;
    :cond_0
    iput-object v3, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->usersList:Ljava/util/ArrayList;

    .line 682
    return-void
.end method

.method public setIsCreate(Z)V
    .locals 2
    .param p1, "isCreate"    # Z

    .prologue
    .line 589
    if-eqz p1, :cond_0

    const/4 v0, 0x7

    :goto_0
    iget-object v1, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->this$0:Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;

    invoke-static {v1}, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;->access$700(Lcom/vkontakte/android/fragments/messages/ChatMembersFragment;)Lcom/vkontakte/android/ui/holder/messages/ChatInfoHolder$Ref;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;->bottom(ILjava/lang/Object;)Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    move-result-object v0

    iput-object v0, p0, Lcom/vkontakte/android/fragments/messages/ChatMembersFragment$Adapter;->chatInfo:Lcom/vkontakte/android/ui/holder/RecyclerSectionAdapter$Data;

    .line 590
    return-void

    .line 589
    :cond_0
    const/16 v0, 0x8

    goto :goto_0
.end method
