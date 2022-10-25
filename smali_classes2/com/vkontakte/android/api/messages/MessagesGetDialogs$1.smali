.class Lcom/vkontakte/android/api/messages/MessagesGetDialogs$1;
.super Lcom/vkontakte/android/data/Parser;
.source "MessagesGetDialogs.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/api/messages/MessagesGetDialogs;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/VKList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/data/Parser",
        "<",
        "Lcom/vkontakte/android/DialogEntry;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/api/messages/MessagesGetDialogs;

.field final synthetic val$profiles:Landroid/util/SparseArray;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/api/messages/MessagesGetDialogs;Landroid/util/SparseArray;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/api/messages/MessagesGetDialogs;

    .prologue
    .line 49
    iput-object p1, p0, Lcom/vkontakte/android/api/messages/MessagesGetDialogs$1;->this$0:Lcom/vkontakte/android/api/messages/MessagesGetDialogs;

    iput-object p2, p0, Lcom/vkontakte/android/api/messages/MessagesGetDialogs$1;->val$profiles:Landroid/util/SparseArray;

    invoke-direct {p0}, Lcom/vkontakte/android/data/Parser;-><init>()V

    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/DialogEntry;
    .locals 17
    .param p1, "msgWrap"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 52
    new-instance v4, Lcom/vkontakte/android/DialogEntry;

    invoke-direct {v4}, Lcom/vkontakte/android/DialogEntry;-><init>()V

    .line 53
    .local v4, "entry":Lcom/vkontakte/android/DialogEntry;
    const-string/jumbo v14, "message"

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    .line 55
    .local v9, "msg":Lorg/json/JSONObject;
    const-string/jumbo v14, "unread"

    move-object/from16 v0, p1

    invoke-virtual {v0, v14}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v14

    iput v14, v4, Lcom/vkontakte/android/DialogEntry;->unreadCount:I

    .line 57
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/api/messages/MessagesGetDialogs$1;->val$profiles:Landroid/util/SparseArray;

    const-string/jumbo v15, "user_id"

    invoke-virtual {v9, v15}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v15

    sget-object v16, Lcom/vkontakte/android/UserProfile;->EMPTY_USER:Lcom/vkontakte/android/UserProfile;

    invoke-virtual/range {v14 .. v16}, Landroid/util/SparseArray;->get(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/vkontakte/android/UserProfile;

    iput-object v14, v4, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    .line 59
    iget-object v14, v4, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    if-nez v14, :cond_0

    .line 60
    new-instance v14, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v14}, Lcom/vkontakte/android/UserProfile;-><init>()V

    iput-object v14, v4, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    .line 61
    iget-object v14, v4, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    const-string/jumbo v15, "user_id"

    invoke-virtual {v9, v15}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v15

    iput v15, v14, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 64
    :cond_0
    new-instance v8, Lcom/vkontakte/android/Message;

    invoke-direct {v8, v9}, Lcom/vkontakte/android/Message;-><init>(Lorg/json/JSONObject;)V

    .line 66
    .local v8, "m":Lcom/vkontakte/android/Message;
    iput-object v8, v4, Lcom/vkontakte/android/DialogEntry;->lastMessage:Lcom/vkontakte/android/Message;

    .line 67
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/api/messages/MessagesGetDialogs$1;->val$profiles:Landroid/util/SparseArray;

    iget v15, v8, Lcom/vkontakte/android/Message;->sender:I

    invoke-static {v14, v15}, Lcom/vkontakte/android/utils/Utils;->containsKey(Landroid/util/SparseArray;I)Z

    move-result v14

    if-eqz v14, :cond_4

    .line 68
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/api/messages/MessagesGetDialogs$1;->val$profiles:Landroid/util/SparseArray;

    iget v15, v8, Lcom/vkontakte/android/Message;->sender:I

    invoke-virtual {v14, v15}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/vkontakte/android/UserProfile;

    iget-object v14, v14, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    iput-object v14, v4, Lcom/vkontakte/android/DialogEntry;->lastMessagePhoto:Ljava/lang/String;

    .line 72
    :goto_0
    iget v14, v8, Lcom/vkontakte/android/Message;->peer:I

    const v15, 0x77359400

    if-le v14, v15, :cond_3

    .line 73
    new-instance v14, Lcom/vkontakte/android/UserProfile;

    invoke-direct {v14}, Lcom/vkontakte/android/UserProfile;-><init>()V

    iput-object v14, v4, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    .line 74
    iget-object v14, v4, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iget v15, v8, Lcom/vkontakte/android/Message;->peer:I

    iput v15, v14, Lcom/vkontakte/android/UserProfile;->uid:I

    .line 75
    iget-object v14, v4, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    const-string/jumbo v15, "title"

    invoke-virtual {v9, v15}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    iput-object v15, v14, Lcom/vkontakte/android/UserProfile;->fullName:Ljava/lang/String;

    .line 76
    iget-object v14, v4, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    const-string/jumbo v15, "admin_id"

    invoke-virtual {v9, v15}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v15

    iput v15, v14, Lcom/vkontakte/android/UserProfile;->online:I

    .line 77
    const/4 v3, 0x0

    .line 78
    .local v3, "dnd":I
    const/4 v10, 0x0

    .line 79
    .local v10, "mute":Z
    const-string/jumbo v14, "push_settings"

    invoke-virtual {v9, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_2

    .line 80
    const-string/jumbo v14, "push_settings"

    invoke-virtual {v9, v14}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    .line 81
    .local v7, "jps":Lorg/json/JSONObject;
    const-string/jumbo v14, "disabled_until"

    invoke-virtual {v7, v14}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    .line 82
    const/4 v14, -0x1

    if-ne v3, v14, :cond_1

    .line 83
    const v3, 0x7fffffff

    .line 85
    :cond_1
    const-string/jumbo v14, "sound"

    invoke-virtual {v7, v14}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v14

    const/4 v15, 0x1

    if-eq v14, v15, :cond_5

    const/4 v10, 0x1

    .line 87
    .end local v7    # "jps":Lorg/json/JSONObject;
    :cond_2
    :goto_1
    new-instance v13, Landroid/os/Bundle;

    invoke-direct {v13}, Landroid/os/Bundle;-><init>()V

    .line 88
    .local v13, "x":Landroid/os/Bundle;
    const-string/jumbo v14, "dnd"

    invoke-virtual {v13, v14, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    .line 89
    const-string/jumbo v14, "mute"

    invoke-virtual {v13, v14, v10}, Landroid/os/Bundle;->putBoolean(Ljava/lang/String;Z)V

    .line 90
    iget-object v14, v4, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    iput-object v13, v14, Lcom/vkontakte/android/UserProfile;->extra:Landroid/os/Bundle;

    .line 91
    const-string/jumbo v14, "photo_50"

    invoke-virtual {v9, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_7

    .line 92
    iget-object v15, v4, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    sget v14, Lcom/vkontakte/android/Global;->displayDensity:F

    const/high16 v16, 0x3f800000    # 1.0f

    cmpl-float v14, v14, v16

    if-lez v14, :cond_6

    const-string/jumbo v14, "photo_100"

    :goto_2
    invoke-virtual {v9, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    iput-object v14, v15, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 119
    .end local v3    # "dnd":I
    .end local v10    # "mute":Z
    .end local v13    # "x":Landroid/os/Bundle;
    :cond_3
    :goto_3
    return-object v4

    .line 70
    :cond_4
    const-string/jumbo v14, "vk"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "Profile for "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    iget v0, v8, Lcom/vkontakte/android/Message;->sender:I

    move/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    const-string/jumbo v16, " not found!!!"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Lcom/vkontakte/android/Log;->e(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_0

    .line 85
    .restart local v3    # "dnd":I
    .restart local v7    # "jps":Lorg/json/JSONObject;
    .restart local v10    # "mute":Z
    :cond_5
    const/4 v10, 0x0

    goto :goto_1

    .line 92
    .end local v7    # "jps":Lorg/json/JSONObject;
    .restart local v13    # "x":Landroid/os/Bundle;
    :cond_6
    const-string/jumbo v14, "photo_50"

    goto :goto_2

    .line 94
    :cond_7
    new-instance v2, Landroid/net/Uri$Builder;

    invoke-direct {v2}, Landroid/net/Uri$Builder;-><init>()V

    .line 95
    .local v2, "bldr":Landroid/net/Uri$Builder;
    const-string/jumbo v14, "vkchatphoto"

    invoke-virtual {v2, v14}, Landroid/net/Uri$Builder;->scheme(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v14

    const-string/jumbo v15, "c"

    invoke-virtual {v14, v15}, Landroid/net/Uri$Builder;->authority(Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 96
    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    .line 97
    .local v11, "ph":Ljava/util/ArrayList;, "Ljava/util/ArrayList<Ljava/lang/String;>;"
    const-string/jumbo v14, "chat_active"

    invoke-virtual {v9, v14}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    .line 98
    .local v1, "act":Lorg/json/JSONArray;
    const/4 v6, 0x0

    .local v6, "j":I
    :goto_4
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v14

    if-ge v6, v14, :cond_b

    .line 99
    invoke-virtual {v1, v6}, Lorg/json/JSONArray;->getInt(I)I

    move-result v14

    invoke-static {v14}, Lcom/vkontakte/android/auth/VKAccountManager;->isCurrentUser(I)Z

    move-result v14

    if-eqz v14, :cond_9

    .line 98
    :cond_8
    add-int/lit8 v6, v6, 0x1

    goto :goto_4

    .line 102
    :cond_9
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/api/messages/MessagesGetDialogs$1;->val$profiles:Landroid/util/SparseArray;

    invoke-virtual {v1, v6}, Lorg/json/JSONArray;->getInt(I)I

    move-result v15

    invoke-static {v14, v15}, Lcom/vkontakte/android/utils/Utils;->containsKey(Landroid/util/SparseArray;I)Z

    move-result v14

    if-eqz v14, :cond_a

    .line 103
    move-object/from16 v0, p0

    iget-object v14, v0, Lcom/vkontakte/android/api/messages/MessagesGetDialogs$1;->val$profiles:Landroid/util/SparseArray;

    invoke-virtual {v1, v6}, Lorg/json/JSONArray;->getInt(I)I

    move-result v15

    invoke-virtual {v14, v15}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lcom/vkontakte/android/UserProfile;

    iget-object v14, v14, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    invoke-virtual {v11, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 106
    :cond_a
    invoke-virtual {v11}, Ljava/util/ArrayList;->size()I

    move-result v14

    const/4 v15, 0x4

    if-ne v14, v15, :cond_8

    .line 110
    :cond_b
    const/4 v5, 0x0

    .line 111
    .local v5, "i":I
    invoke-virtual {v11}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v14

    :goto_5
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_c

    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Ljava/lang/String;

    .line 112
    .local v12, "photo":Ljava/lang/String;
    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "photo"

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v2, v15, v12}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    .line 113
    add-int/lit8 v5, v5, 0x1

    .line 114
    goto :goto_5

    .line 115
    .end local v12    # "photo":Ljava/lang/String;
    :cond_c
    iget-object v14, v4, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    invoke-virtual {v2}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v15

    invoke-virtual {v15}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v15

    iput-object v15, v14, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    .line 116
    const-string/jumbo v14, "vk"

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v16, "Set photo "

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    iget-object v0, v4, Lcom/vkontakte/android/DialogEntry;->profile:Lcom/vkontakte/android/UserProfile;

    move-object/from16 v16, v0

    move-object/from16 v0, v16

    iget-object v0, v0, Lcom/vkontakte/android/UserProfile;->photo:Ljava/lang/String;

    move-object/from16 v16, v0

    invoke-virtual/range {v15 .. v16}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v15

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    invoke-static {v14, v15}, Lcom/vkontakte/android/Log;->i(Ljava/lang/String;Ljava/lang/String;)V

    goto/16 :goto_3
.end method

.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 49
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/messages/MessagesGetDialogs$1;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/DialogEntry;

    move-result-object v0

    return-object v0
.end method
