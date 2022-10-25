.class public Lcom/vkontakte/android/utils/L;
.super Ljava/lang/Object;
.source "L.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/vkontakte/android/utils/L$LogReceiver;,
        Lcom/vkontakte/android/utils/L$Callback;,
        Lcom/vkontakte/android/utils/L$LogType;
    }
.end annotation


# static fields
.field private static final DEFAULT_LOG_RECEIVER:Lcom/vkontakte/android/utils/L$LogReceiver;

.field private static logReceiver:Lcom/vkontakte/android/utils/L$LogReceiver;
    .annotation build Landroid/support/annotation/NonNull;
    .end annotation
.end field

.field private static sInstance:Lcom/vkontakte/android/utils/L;


# instance fields
.field private callback:Lcom/vkontakte/android/utils/L$Callback;

.field private logcat:Lcom/vk/core/logging/Logcat;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .prologue
    .line 30
    new-instance v0, Lcom/vkontakte/android/utils/L$1;

    invoke-direct {v0}, Lcom/vkontakte/android/utils/L$1;-><init>()V

    sput-object v0, Lcom/vkontakte/android/utils/L;->DEFAULT_LOG_RECEIVER:Lcom/vkontakte/android/utils/L$LogReceiver;

    .line 78
    sget-object v0, Lcom/vkontakte/android/utils/L;->DEFAULT_LOG_RECEIVER:Lcom/vkontakte/android/utils/L$LogReceiver;

    sput-object v0, Lcom/vkontakte/android/utils/L;->logReceiver:Lcom/vkontakte/android/utils/L$LogReceiver;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .prologue
    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static varargs d(Ljava/lang/Throwable;[Ljava/lang/Object;)V
    .locals 1
    .param p0, "e"    # Ljava/lang/Throwable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "o"    # [Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 110
    sget-object v0, Lcom/vkontakte/android/utils/L$LogType;->d:Lcom/vkontakte/android/utils/L$LogType;

    invoke-static {v0, p0, p1}, Lcom/vkontakte/android/utils/L;->log(Lcom/vkontakte/android/utils/L$LogType;Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 111
    return-void
.end method

.method public static varargs d([Ljava/lang/Object;)V
    .locals 1
    .param p0, "o"    # [Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 114
    sget-object v0, Lcom/vkontakte/android/utils/L$LogType;->d:Lcom/vkontakte/android/utils/L$LogType;

    invoke-static {v0, p0}, Lcom/vkontakte/android/utils/L;->log(Lcom/vkontakte/android/utils/L$LogType;[Ljava/lang/Object;)V

    .line 115
    return-void
.end method

.method public static varargs e(Ljava/lang/Throwable;[Ljava/lang/Object;)V
    .locals 1
    .param p0, "e"    # Ljava/lang/Throwable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "o"    # [Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 140
    sget-object v0, Lcom/vkontakte/android/utils/L$LogType;->e:Lcom/vkontakte/android/utils/L$LogType;

    invoke-static {v0, p0, p1}, Lcom/vkontakte/android/utils/L;->log(Lcom/vkontakte/android/utils/L$LogType;Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 141
    return-void
.end method

.method public static varargs e([Ljava/lang/Object;)V
    .locals 1
    .param p0, "o"    # [Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 144
    sget-object v0, Lcom/vkontakte/android/utils/L$LogType;->e:Lcom/vkontakte/android/utils/L$LogType;

    invoke-static {v0, p0}, Lcom/vkontakte/android/utils/L;->log(Lcom/vkontakte/android/utils/L$LogType;[Ljava/lang/Object;)V

    .line 145
    return-void
.end method

.method public static getInstance()Lcom/vkontakte/android/utils/L;
    .locals 1

    .prologue
    .line 81
    sget-object v0, Lcom/vkontakte/android/utils/L;->sInstance:Lcom/vkontakte/android/utils/L;

    if-nez v0, :cond_0

    .line 82
    new-instance v0, Lcom/vkontakte/android/utils/L;

    invoke-direct {v0}, Lcom/vkontakte/android/utils/L;-><init>()V

    sput-object v0, Lcom/vkontakte/android/utils/L;->sInstance:Lcom/vkontakte/android/utils/L;

    .line 84
    :cond_0
    sget-object v0, Lcom/vkontakte/android/utils/L;->sInstance:Lcom/vkontakte/android/utils/L;

    return-object v0
.end method

.method public static varargs i(Ljava/lang/Throwable;[Ljava/lang/Object;)V
    .locals 1
    .param p0, "e"    # Ljava/lang/Throwable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "o"    # [Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 120
    sget-object v0, Lcom/vkontakte/android/utils/L$LogType;->i:Lcom/vkontakte/android/utils/L$LogType;

    invoke-static {v0, p0, p1}, Lcom/vkontakte/android/utils/L;->log(Lcom/vkontakte/android/utils/L$LogType;Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 121
    return-void
.end method

.method public static varargs i([Ljava/lang/Object;)V
    .locals 1
    .param p0, "o"    # [Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 124
    sget-object v0, Lcom/vkontakte/android/utils/L$LogType;->i:Lcom/vkontakte/android/utils/L$LogType;

    invoke-static {v0, p0}, Lcom/vkontakte/android/utils/L;->log(Lcom/vkontakte/android/utils/L$LogType;[Ljava/lang/Object;)V

    .line 125
    return-void
.end method

.method private static isLogEnable()Z
    .locals 1

    .prologue
    .line 218
    invoke-static {}, Lcom/vkontakte/android/utils/L;->getInstance()Lcom/vkontakte/android/utils/L;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/utils/L;->callback:Lcom/vkontakte/android/utils/L$Callback;

    if-eqz v0, :cond_0

    invoke-static {}, Lcom/vkontakte/android/utils/L;->getInstance()Lcom/vkontakte/android/utils/L;

    move-result-object v0

    iget-object v0, v0, Lcom/vkontakte/android/utils/L;->callback:Lcom/vkontakte/android/utils/L$Callback;

    invoke-interface {v0}, Lcom/vkontakte/android/utils/L$Callback;->isLogEnable()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    :goto_0
    return v0

    :cond_0
    const/4 v0, 0x0

    goto :goto_0
.end method

.method private static log(Lcom/vkontakte/android/utils/L$LogType;Ljava/lang/String;Ljava/lang/Throwable;)V
    .locals 7
    .param p0, "logType"    # Lcom/vkontakte/android/utils/L$LogType;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "message"    # Ljava/lang/String;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "e"    # Ljava/lang/Throwable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param

    .prologue
    .line 181
    invoke-static {}, Lcom/vkontakte/android/utils/L;->isLogEnable()Z

    move-result v5

    if-eqz v5, :cond_0

    .line 182
    invoke-static {}, Lcom/vkontakte/android/utils/L;->trace()Ljava/lang/StackTraceElement;

    move-result-object v2

    .line 184
    .local v2, "element":Ljava/lang/StackTraceElement;
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 185
    .local v0, "builder":Ljava/lang/StringBuilder;
    if-eqz v2, :cond_1

    .line 186
    invoke-virtual {v2}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v2}, Ljava/lang/StackTraceElement;->getLineNumber()I

    move-result v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string/jumbo v6, " "

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 187
    invoke-virtual {v2}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v1

    .line 191
    .local v1, "className":Ljava/lang/String;
    :goto_0
    const-string/jumbo v5, "com.vkontakte.android"

    invoke-virtual {v1, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_2

    const-string/jumbo v5, "com.vkontakte.android"

    .line 192
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    invoke-virtual {v1, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    .line 193
    .local v4, "tag":Ljava/lang/String;
    :goto_1
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 194
    .local v3, "msg":Ljava/lang/String;
    if-nez p2, :cond_3

    .line 195
    sget-object v5, Lcom/vkontakte/android/utils/L;->logReceiver:Lcom/vkontakte/android/utils/L$LogReceiver;

    invoke-interface {v5, p0, v4, v3}, Lcom/vkontakte/android/utils/L$LogReceiver;->log(Lcom/vkontakte/android/utils/L$LogType;Ljava/lang/String;Ljava/lang/String;)V

    .line 200
    .end local v0    # "builder":Ljava/lang/StringBuilder;
    .end local v1    # "className":Ljava/lang/String;
    .end local v2    # "element":Ljava/lang/StackTraceElement;
    .end local v3    # "msg":Ljava/lang/String;
    .end local v4    # "tag":Ljava/lang/String;
    :cond_0
    :goto_2
    return-void

    .line 189
    .restart local v0    # "builder":Ljava/lang/StringBuilder;
    .restart local v2    # "element":Ljava/lang/StackTraceElement;
    :cond_1
    const-class v5, Lcom/vkontakte/android/utils/L;

    invoke-virtual {v5}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    .restart local v1    # "className":Ljava/lang/String;
    goto :goto_0

    :cond_2
    move-object v4, v1

    .line 192
    goto :goto_1

    .line 197
    .restart local v3    # "msg":Ljava/lang/String;
    .restart local v4    # "tag":Ljava/lang/String;
    :cond_3
    sget-object v5, Lcom/vkontakte/android/utils/L;->logReceiver:Lcom/vkontakte/android/utils/L$LogReceiver;

    invoke-interface {v5, p0, v4, v3, p2}, Lcom/vkontakte/android/utils/L$LogReceiver;->log(Lcom/vkontakte/android/utils/L$LogType;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    goto :goto_2
.end method

.method private static varargs log(Lcom/vkontakte/android/utils/L$LogType;Ljava/lang/Throwable;[Ljava/lang/Object;)V
    .locals 6
    .param p0, "logType"    # Lcom/vkontakte/android/utils/L$LogType;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "e"    # Ljava/lang/Throwable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p2, "o"    # [Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 150
    invoke-static {}, Lcom/vkontakte/android/utils/L;->isLogEnable()Z

    move-result v2

    if-eqz v2, :cond_1

    .line 151
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 152
    .local v0, "builder":Ljava/lang/StringBuilder;
    array-length v3, p2

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v3, :cond_0

    aget-object v1, p2, v2

    .line 153
    .local v1, "object":Ljava/lang/Object;
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string/jumbo v5, " "

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 155
    .end local v1    # "object":Ljava/lang/Object;
    :cond_0
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {p0, v2, p1}, Lcom/vkontakte/android/utils/L;->log(Lcom/vkontakte/android/utils/L$LogType;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 157
    .end local v0    # "builder":Ljava/lang/StringBuilder;
    :cond_1
    return-void
.end method

.method private static varargs log(Lcom/vkontakte/android/utils/L$LogType;[Ljava/lang/Object;)V
    .locals 1
    .param p0, "logType"    # Lcom/vkontakte/android/utils/L$LogType;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param
    .param p1, "o"    # [Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 177
    const/4 v0, 0x0

    invoke-static {p0, v0, p1}, Lcom/vkontakte/android/utils/L;->log(Lcom/vkontakte/android/utils/L$LogType;Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 178
    return-void
.end method

.method private static trace()Ljava/lang/StackTraceElement;
    .locals 7
    .annotation build Landroid/support/annotation/Nullable;
    .end annotation

    .prologue
    .line 204
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->getStackTrace()[Ljava/lang/StackTraceElement;

    move-result-object v0

    .line 205
    .local v0, "e":[Ljava/lang/StackTraceElement;
    const/4 v1, 0x0

    .line 206
    .local v1, "found":Z
    array-length v4, v0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v4, :cond_2

    aget-object v2, v0, v3

    .line 207
    .local v2, "s":Ljava/lang/StackTraceElement;
    invoke-virtual {v2}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v5

    const-class v6, Lcom/vkontakte/android/utils/L;

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 208
    const/4 v1, 0x1

    .line 210
    :cond_0
    if-eqz v1, :cond_1

    invoke-virtual {v2}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    move-result-object v5

    const-class v6, Lcom/vkontakte/android/utils/L;

    invoke-virtual {v6}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1

    .line 214
    .end local v2    # "s":Ljava/lang/StackTraceElement;
    :goto_1
    return-object v2

    .line 206
    .restart local v2    # "s":Ljava/lang/StackTraceElement;
    :cond_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 214
    .end local v2    # "s":Ljava/lang/StackTraceElement;
    :cond_2
    const/4 v2, 0x0

    goto :goto_1
.end method

.method public static varargs v(Ljava/lang/Throwable;[Ljava/lang/Object;)V
    .locals 1
    .param p0, "e"    # Ljava/lang/Throwable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "o"    # [Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 100
    sget-object v0, Lcom/vkontakte/android/utils/L$LogType;->v:Lcom/vkontakte/android/utils/L$LogType;

    invoke-static {v0, p0, p1}, Lcom/vkontakte/android/utils/L;->log(Lcom/vkontakte/android/utils/L$LogType;Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 101
    return-void
.end method

.method public static varargs v([Ljava/lang/Object;)V
    .locals 1
    .param p0, "o"    # [Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 104
    sget-object v0, Lcom/vkontakte/android/utils/L$LogType;->v:Lcom/vkontakte/android/utils/L$LogType;

    invoke-static {v0, p0}, Lcom/vkontakte/android/utils/L;->log(Lcom/vkontakte/android/utils/L$LogType;[Ljava/lang/Object;)V

    .line 105
    return-void
.end method

.method public static varargs w(Ljava/lang/Throwable;[Ljava/lang/Object;)V
    .locals 1
    .param p0, "e"    # Ljava/lang/Throwable;
        .annotation build Landroid/support/annotation/Nullable;
        .end annotation
    .end param
    .param p1, "o"    # [Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 130
    sget-object v0, Lcom/vkontakte/android/utils/L$LogType;->w:Lcom/vkontakte/android/utils/L$LogType;

    invoke-static {v0, p0, p1}, Lcom/vkontakte/android/utils/L;->log(Lcom/vkontakte/android/utils/L$LogType;Ljava/lang/Throwable;[Ljava/lang/Object;)V

    .line 131
    return-void
.end method

.method public static varargs w([Ljava/lang/Object;)V
    .locals 1
    .param p0, "o"    # [Ljava/lang/Object;
        .annotation build Landroid/support/annotation/NonNull;
        .end annotation
    .end param

    .prologue
    .line 134
    sget-object v0, Lcom/vkontakte/android/utils/L$LogType;->w:Lcom/vkontakte/android/utils/L$LogType;

    invoke-static {v0, p0}, Lcom/vkontakte/android/utils/L;->log(Lcom/vkontakte/android/utils/L$LogType;[Ljava/lang/Object;)V

    .line 135
    return-void
.end method


# virtual methods
.method public captureStart()V
    .locals 2

    .prologue
    .line 160
    new-instance v0, Lcom/vk/core/logging/Logcat;

    invoke-static {}, Lcom/vkontakte/android/Log;->getLogPath()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Lcom/vk/core/logging/Logcat;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/vkontakte/android/utils/L;->logcat:Lcom/vk/core/logging/Logcat;

    .line 161
    iget-object v0, p0, Lcom/vkontakte/android/utils/L;->logcat:Lcom/vk/core/logging/Logcat;

    invoke-virtual {v0}, Lcom/vk/core/logging/Logcat;->start()V

    .line 162
    return-void
.end method

.method public captureStop()V
    .locals 3

    .prologue
    .line 165
    iget-object v1, p0, Lcom/vkontakte/android/utils/L;->logcat:Lcom/vk/core/logging/Logcat;

    if-nez v1, :cond_0

    .line 166
    new-instance v1, Lcom/vk/core/logging/Logcat;

    invoke-static {}, Lcom/vkontakte/android/Log;->getLogPath()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lcom/vk/core/logging/Logcat;-><init>(Ljava/lang/String;)V

    iput-object v1, p0, Lcom/vkontakte/android/utils/L;->logcat:Lcom/vk/core/logging/Logcat;

    .line 168
    :cond_0
    iget-object v1, p0, Lcom/vkontakte/android/utils/L;->logcat:Lcom/vk/core/logging/Logcat;

    invoke-virtual {v1}, Lcom/vk/core/logging/Logcat;->stop()Z

    move-result v1

    if-eqz v1, :cond_1

    iget-object v1, p0, Lcom/vkontakte/android/utils/L;->callback:Lcom/vkontakte/android/utils/L$Callback;

    if-eqz v1, :cond_1

    .line 169
    iget-object v1, p0, Lcom/vkontakte/android/utils/L;->logcat:Lcom/vk/core/logging/Logcat;

    invoke-virtual {v1}, Lcom/vk/core/logging/Logcat;->getDocumentUri()Ljava/lang/String;

    move-result-object v0

    .line 170
    .local v0, "path":Ljava/lang/String;
    if-eqz v0, :cond_1

    .line 171
    iget-object v1, p0, Lcom/vkontakte/android/utils/L;->callback:Lcom/vkontakte/android/utils/L$Callback;

    invoke-interface {v1, v0}, Lcom/vkontakte/android/utils/L$Callback;->onCapture(Ljava/lang/String;)V

    .line 174
    .end local v0    # "path":Ljava/lang/String;
    :cond_1
    return-void
.end method

.method public clear()V
    .locals 1

    .prologue
    .line 93
    invoke-static {}, Lcom/vkontakte/android/Log;->getLogDir()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/vk/core/util/FileUtils;->deleteFile(Ljava/lang/String;)Z

    .line 94
    return-void
.end method

.method public init(Lcom/vkontakte/android/utils/L$Callback;)V
    .locals 0
    .param p1, "callback"    # Lcom/vkontakte/android/utils/L$Callback;

    .prologue
    .line 88
    iput-object p1, p0, Lcom/vkontakte/android/utils/L;->callback:Lcom/vkontakte/android/utils/L$Callback;

    .line 89
    invoke-virtual {p0}, Lcom/vkontakte/android/utils/L;->captureStop()V

    .line 90
    return-void
.end method
