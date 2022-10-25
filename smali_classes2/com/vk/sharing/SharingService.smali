.class public final Lcom/vk/sharing/SharingService;
.super Landroid/app/IntentService;
.source "SharingService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vk/sharing/SharingService$RepostGroupJobHandler;,
        Lcom/vk/sharing/SharingService$RepostWallJobHandler;,
        Lcom/vk/sharing/SharingService$MessageJobHandler;,
        Lcom/vk/sharing/SharingService$JobHandler;,
        Lcom/vk/sharing/SharingService$JobInfo;
    }
.end annotation


# static fields
.field public static final CALL_MESSAGE:I = 0x1

.field public static final CALL_REPOST_GROUP:I = 0x3

.field public static final CALL_REPOST_WALL:I = 0x2

.field public static final EXTRA_ATTACHMENT_INFO:Ljava/lang/String; = "attachment_info"

.field public static final EXTRA_CALL:Ljava/lang/String; = "call"

.field public static final EXTRA_REFERER:Ljava/lang/String; = "referer"

.field public static final EXTRA_TARGET:Ljava/lang/String; = "target"

.field public static final EXTRA_TEXT:Ljava/lang/String; = "text"

.field public static final EXTRA_TOTAL_TARGETS:Ljava/lang/String; = "total_targets"

.field private static final PREF_JOB_CURRENT:Ljava/lang/String; = "job_current"

.field private static final PREF_JOB_FAILURES:Ljava/lang/String; = "job_failures"

.field private static final PREF_JOB_ID:Ljava/lang/String; = "job_id"

.field private static final PREF_JOB_TOTAL:Ljava/lang/String; = "job_total"

.field private static final PREF_JOB_TYPE:Ljava/lang/String; = "job_type"

.field private static final PREF_NAME:Ljava/lang/String; = "sharing_service"


# instance fields
.field private handler:Lcom/vk/sharing/SharingService$JobHandler;

.field private info:Lcom/vk/sharing/SharingService$JobInfo;

.field private preferences:Landroid/content/SharedPreferences;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 65
    const-string/jumbo v0, "Sharing"

    invoke-direct {p0, v0}, Landroid/app/IntentService;-><init>(Ljava/lang/String;)V

    .line 66
    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/vk/sharing/SharingService;->setIntentRedelivery(Z)V

    .line 67
    return-void
.end method

.method private createJobHandler(Lcom/vk/sharing/SharingService$JobInfo;)Lcom/vk/sharing/SharingService$JobHandler;
    .locals 3
    .param p1, "info"    # Lcom/vk/sharing/SharingService$JobInfo;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    .line 123
    invoke-static {p1}, Lcom/vk/sharing/SharingService$JobInfo;->access$300(Lcom/vk/sharing/SharingService$JobInfo;)I

    move-result v0

    packed-switch v0, :pswitch_data_0

    .line 131
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string/jumbo v2, "Unknown type: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p1}, Lcom/vk/sharing/SharingService$JobInfo;->access$300(Lcom/vk/sharing/SharingService$JobInfo;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 125
    :pswitch_0
    new-instance v0, Lcom/vk/sharing/SharingService$MessageJobHandler;

    iget-object v1, p0, Lcom/vk/sharing/SharingService;->preferences:Landroid/content/SharedPreferences;

    invoke-direct {v0, v1}, Lcom/vk/sharing/SharingService$MessageJobHandler;-><init>(Landroid/content/SharedPreferences;)V

    .line 129
    :goto_0
    return-object v0

    .line 127
    :pswitch_1
    new-instance v0, Lcom/vk/sharing/SharingService$RepostWallJobHandler;

    invoke-direct {v0}, Lcom/vk/sharing/SharingService$RepostWallJobHandler;-><init>()V

    goto :goto_0

    .line 129
    :pswitch_2
    new-instance v0, Lcom/vk/sharing/SharingService$RepostGroupJobHandler;

    invoke-direct {v0}, Lcom/vk/sharing/SharingService$RepostGroupJobHandler;-><init>()V

    goto :goto_0

    .line 123
    nop

    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_1
        :pswitch_2
    .end packed-switch
.end method

.method private createJobInfo(Landroid/content/Intent;)Lcom/vk/sharing/SharingService$JobInfo;
    .locals 7
    .param p1, "intent"    # Landroid/content/Intent;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation

    .prologue
    const/4 v6, 0x1

    const/4 v5, 0x0

    .line 95
    iget-object v2, p0, Lcom/vk/sharing/SharingService;->preferences:Landroid/content/SharedPreferences;

    const-string/jumbo v3, "job_id"

    const/4 v4, 0x0

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 96
    .local v0, "id":Ljava/lang/String;
    if-nez v0, :cond_0

    .line 97
    new-instance v1, Lcom/vk/sharing/SharingService$JobInfo;

    .line 98
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v2

    invoke-virtual {v2}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v2

    const-string/jumbo v3, "call"

    .line 99
    invoke-virtual {p1, v3, v5}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v3

    const-string/jumbo v4, "total_targets"

    .line 100
    invoke-virtual {p1, v4, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    invoke-direct {v1, v2, v3, v4}, Lcom/vk/sharing/SharingService$JobInfo;-><init>(Ljava/lang/String;II)V

    .line 103
    .local v1, "info":Lcom/vk/sharing/SharingService$JobInfo;
    iget-object v2, p0, Lcom/vk/sharing/SharingService;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v3, "job_id"

    .line 104
    invoke-static {v1}, Lcom/vk/sharing/SharingService$JobInfo;->access$400(Lcom/vk/sharing/SharingService$JobInfo;)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v3, "job_type"

    .line 105
    invoke-static {v1}, Lcom/vk/sharing/SharingService$JobInfo;->access$300(Lcom/vk/sharing/SharingService$JobInfo;)I

    move-result v4

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v3, "job_total"

    .line 106
    invoke-static {v1}, Lcom/vk/sharing/SharingService$JobInfo;->access$200(Lcom/vk/sharing/SharingService$JobInfo;)I

    move-result v4

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v3, "job_current"

    .line 107
    invoke-static {v1}, Lcom/vk/sharing/SharingService$JobInfo;->access$100(Lcom/vk/sharing/SharingService$JobInfo;)I

    move-result v4

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    const-string/jumbo v3, "job_failures"

    .line 108
    invoke-static {v1}, Lcom/vk/sharing/SharingService$JobInfo;->access$000(Lcom/vk/sharing/SharingService$JobInfo;)I

    move-result v4

    invoke-interface {v2, v3, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v2

    .line 109
    invoke-interface {v2}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 116
    .end local v1    # "info":Lcom/vk/sharing/SharingService$JobInfo;
    :goto_0
    return-object v1

    .line 113
    :cond_0
    new-instance v1, Lcom/vk/sharing/SharingService$JobInfo;

    iget-object v2, p0, Lcom/vk/sharing/SharingService;->preferences:Landroid/content/SharedPreferences;

    const-string/jumbo v3, "job_type"

    .line 115
    invoke-interface {v2, v3, v5}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v2

    iget-object v3, p0, Lcom/vk/sharing/SharingService;->preferences:Landroid/content/SharedPreferences;

    const-string/jumbo v4, "job_total"

    .line 116
    invoke-interface {v3, v4, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    invoke-direct {v1, v0, v2, v3}, Lcom/vk/sharing/SharingService$JobInfo;-><init>(Ljava/lang/String;II)V

    goto :goto_0
.end method

.method private writeResult(Z)V
    .locals 4
    .param p1, "success"    # Z

    .prologue
    .line 136
    iget-object v1, p0, Lcom/vk/sharing/SharingService;->info:Lcom/vk/sharing/SharingService$JobInfo;

    invoke-virtual {v1}, Lcom/vk/sharing/SharingService$JobInfo;->complete()I

    .line 137
    if-nez p1, :cond_0

    .line 138
    iget-object v1, p0, Lcom/vk/sharing/SharingService;->info:Lcom/vk/sharing/SharingService$JobInfo;

    invoke-virtual {v1}, Lcom/vk/sharing/SharingService$JobInfo;->fail()I

    .line 141
    :cond_0
    iget-object v1, p0, Lcom/vk/sharing/SharingService;->preferences:Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    .line 142
    .local v0, "editor":Landroid/content/SharedPreferences$Editor;
    iget-object v1, p0, Lcom/vk/sharing/SharingService;->info:Lcom/vk/sharing/SharingService$JobInfo;

    invoke-virtual {v1}, Lcom/vk/sharing/SharingService$JobInfo;->isCompleted()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 143
    iget-object v1, p0, Lcom/vk/sharing/SharingService;->handler:Lcom/vk/sharing/SharingService$JobHandler;

    iget-object v2, p0, Lcom/vk/sharing/SharingService;->info:Lcom/vk/sharing/SharingService$JobInfo;

    invoke-virtual {v1, v2}, Lcom/vk/sharing/SharingService$JobHandler;->onDone(Lcom/vk/sharing/SharingService$JobInfo;)V

    .line 144
    const/4 v1, 0x0

    iput-object v1, p0, Lcom/vk/sharing/SharingService;->info:Lcom/vk/sharing/SharingService$JobInfo;

    .line 145
    const-string/jumbo v1, "job_id"

    invoke-interface {v0, v1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    .line 150
    :goto_0
    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V

    .line 151
    return-void

    .line 147
    :cond_1
    const-string/jumbo v1, "job_current"

    iget-object v2, p0, Lcom/vk/sharing/SharingService;->info:Lcom/vk/sharing/SharingService$JobInfo;

    invoke-static {v2}, Lcom/vk/sharing/SharingService$JobInfo;->access$100(Lcom/vk/sharing/SharingService$JobInfo;)I

    move-result v2

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string/jumbo v2, "job_failures"

    iget-object v3, p0, Lcom/vk/sharing/SharingService;->info:Lcom/vk/sharing/SharingService$JobInfo;

    .line 148
    invoke-static {v3}, Lcom/vk/sharing/SharingService$JobInfo;->access$000(Lcom/vk/sharing/SharingService$JobInfo;)I

    move-result v3

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    goto :goto_0
.end method


# virtual methods
.method public onCreate()V
    .locals 2

    .prologue
    .line 71
    invoke-super {p0}, Landroid/app/IntentService;->onCreate()V

    .line 72
    const-string/jumbo v0, "sharing_service"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lcom/vk/sharing/SharingService;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/sharing/SharingService;->preferences:Landroid/content/SharedPreferences;

    .line 73
    return-void
.end method

.method protected onHandleIntent(Landroid/content/Intent;)V
    .locals 3
    .param p1, "intent"    # Landroid/content/Intent;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 77
    if-nez p1, :cond_0

    .line 78
    const/4 v0, 0x1

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    const-string/jumbo v2, "Intent is null"

    aput-object v2, v0, v1

    invoke-static {v0}, Lcom/vkontakte/android/utils/L;->w([Ljava/lang/Object;)V

    .line 91
    :goto_0
    return-void

    .line 82
    :cond_0
    iget-object v0, p0, Lcom/vk/sharing/SharingService;->info:Lcom/vk/sharing/SharingService$JobInfo;

    if-nez v0, :cond_1

    .line 83
    invoke-direct {p0, p1}, Lcom/vk/sharing/SharingService;->createJobInfo(Landroid/content/Intent;)Lcom/vk/sharing/SharingService$JobInfo;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/sharing/SharingService;->info:Lcom/vk/sharing/SharingService$JobInfo;

    .line 86
    :cond_1
    iget-object v0, p0, Lcom/vk/sharing/SharingService;->handler:Lcom/vk/sharing/SharingService$JobHandler;

    if-nez v0, :cond_2

    .line 87
    iget-object v0, p0, Lcom/vk/sharing/SharingService;->info:Lcom/vk/sharing/SharingService$JobInfo;

    invoke-direct {p0, v0}, Lcom/vk/sharing/SharingService;->createJobHandler(Lcom/vk/sharing/SharingService$JobInfo;)Lcom/vk/sharing/SharingService$JobHandler;

    move-result-object v0

    iput-object v0, p0, Lcom/vk/sharing/SharingService;->handler:Lcom/vk/sharing/SharingService$JobHandler;

    .line 90
    :cond_2
    iget-object v0, p0, Lcom/vk/sharing/SharingService;->handler:Lcom/vk/sharing/SharingService$JobHandler;

    invoke-virtual {v0, p1}, Lcom/vk/sharing/SharingService$JobHandler;->onHandle(Landroid/content/Intent;)Z

    move-result v0

    invoke-direct {p0, v0}, Lcom/vk/sharing/SharingService;->writeResult(Z)V

    goto :goto_0
.end method
