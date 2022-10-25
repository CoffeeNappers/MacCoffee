.class Lcom/vkontakte/android/api/account/AccountGetCommentGroups$1;
.super Lcom/vkontakte/android/data/Parser;
.source "AccountGetCommentGroups.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/vkontakte/android/api/account/AccountGetCommentGroups;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/data/VKList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/vkontakte/android/data/Parser",
        "<",
        "Lcom/vkontakte/android/api/Group;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/vkontakte/android/api/account/AccountGetCommentGroups;


# direct methods
.method constructor <init>(Lcom/vkontakte/android/api/account/AccountGetCommentGroups;)V
    .locals 0
    .param p1, "this$0"    # Lcom/vkontakte/android/api/account/AccountGetCommentGroups;

    .prologue
    .line 31
    iput-object p1, p0, Lcom/vkontakte/android/api/account/AccountGetCommentGroups$1;->this$0:Lcom/vkontakte/android/api/account/AccountGetCommentGroups;

    invoke-direct {p0}, Lcom/vkontakte/android/data/Parser;-><init>()V

    return-void
.end method


# virtual methods
.method public parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/Group;
    .locals 1
    .param p1, "o"    # Lorg/json/JSONObject;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 34
    new-instance v0, Lcom/vkontakte/android/api/Group;

    invoke-direct {v0, p1}, Lcom/vkontakte/android/api/Group;-><init>(Lorg/json/JSONObject;)V

    return-object v0
.end method

.method public bridge synthetic parse(Lorg/json/JSONObject;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .prologue
    .line 31
    invoke-virtual {p0, p1}, Lcom/vkontakte/android/api/account/AccountGetCommentGroups$1;->parse(Lorg/json/JSONObject;)Lcom/vkontakte/android/api/Group;

    move-result-object v0

    return-object v0
.end method
