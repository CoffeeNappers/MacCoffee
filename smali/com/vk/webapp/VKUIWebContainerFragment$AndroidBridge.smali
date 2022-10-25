.class Lcom/vk/webapp/VKUIWebContainerFragment$AndroidBridge;
.super Ljava/lang/Object;
.source "VKUIWebContainerFragment.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/vk/webapp/VKUIWebContainerFragment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "AndroidBridge"
.end annotation


# static fields
.field private static final JS_RESULT_CANCEL:Ljava/lang/String; = "cancel"

.field private static final JS_RESULT_FAIL:Ljava/lang/String; = "fail"

.field private static final JS_RESULT_SUCCESS:Ljava/lang/String; = "success"


# instance fields
.field final synthetic this$0:Lcom/vk/webapp/VKUIWebContainerFragment;


# direct methods
.method constructor <init>(Lcom/vk/webapp/VKUIWebContainerFragment;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vk/webapp/VKUIWebContainerFragment;

    .prologue
    .line 80
    iput-object p1, p0, Lcom/vk/webapp/VKUIWebContainerFragment$AndroidBridge;->this$0:Lcom/vk/webapp/VKUIWebContainerFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private parseResult(Ljava/lang/String;)I
    .locals 6
    .param p1, "data"    # Ljava/lang/String;

    .prologue
    const/4 v3, -0x1

    const/4 v4, 0x0

    .line 94
    :try_start_0
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 95
    .local v1, "jsonObject":Lorg/json/JSONObject;
    const-string/jumbo v5, "status"

    invoke-virtual {v1, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 97
    .local v2, "resStr":Ljava/lang/String;
    invoke-virtual {v2}, Ljava/lang/String;->hashCode()I

    move-result v5

    sparse-switch v5, :sswitch_data_0

    :cond_0
    move v5, v3

    :goto_0
    packed-switch v5, :pswitch_data_0

    move v3, v4

    .line 105
    .end local v1    # "jsonObject":Lorg/json/JSONObject;
    .end local v2    # "resStr":Ljava/lang/String;
    :goto_1
    :pswitch_0
    return v3

    .line 97
    .restart local v1    # "jsonObject":Lorg/json/JSONObject;
    .restart local v2    # "resStr":Ljava/lang/String;
    :sswitch_0
    const-string/jumbo v5, "success"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    move v5, v4

    goto :goto_0

    :sswitch_1
    const-string/jumbo v5, "fail"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    const/4 v5, 0x1

    goto :goto_0

    :sswitch_2
    const-string/jumbo v5, "cancel"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result v5

    if-eqz v5, :cond_0

    const/4 v5, 0x2

    goto :goto_0

    :pswitch_1
    move v3, v4

    .line 99
    goto :goto_1

    :pswitch_2
    move v3, v4

    .line 100
    goto :goto_1

    .line 104
    .end local v1    # "jsonObject":Lorg/json/JSONObject;
    .end local v2    # "resStr":Ljava/lang/String;
    :catch_0
    move-exception v0

    .local v0, "exc":Ljava/lang/Exception;
    move v3, v4

    .line 105
    goto :goto_1

    .line 97
    nop

    :sswitch_data_0
    .sparse-switch
        -0x6f4abffd -> :sswitch_0
        -0x5185d186 -> :sswitch_2
        0x2fd71e -> :sswitch_1
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method


# virtual methods
.method public VKWebAppClose(Ljava/lang/String;)V
    .locals 2
    .param p1, "data"    # Ljava/lang/String;
    .annotation runtime Landroid/webkit/JavascriptInterface;
    .end annotation

    .prologue
    .line 88
    iget-object v0, p0, Lcom/vk/webapp/VKUIWebContainerFragment$AndroidBridge;->this$0:Lcom/vk/webapp/VKUIWebContainerFragment;

    invoke-virtual {v0}, Lcom/vk/webapp/VKUIWebContainerFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-direct {p0, p1}, Lcom/vk/webapp/VKUIWebContainerFragment$AndroidBridge;->parseResult(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/app/Activity;->setResult(I)V

    .line 89
    iget-object v0, p0, Lcom/vk/webapp/VKUIWebContainerFragment$AndroidBridge;->this$0:Lcom/vk/webapp/VKUIWebContainerFragment;

    invoke-virtual {v0}, Lcom/vk/webapp/VKUIWebContainerFragment;->getActivity()Landroid/app/Activity;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->finish()V

    .line 90
    return-void
.end method
