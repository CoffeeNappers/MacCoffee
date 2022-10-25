.class public final Lcom/my/tracker/async/commands/k;
.super Lcom/my/tracker/async/commands/f;
.source "TrackMajorEventsCommand.java"


# instance fields
.field private e:J


# direct methods
.method public constructor <init>(Ljava/lang/String;Lcom/my/tracker/database/a;Lcom/my/tracker/b;Landroid/content/Context;)V
    .locals 4

    .prologue
    .line 52
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/my/tracker/async/commands/f;-><init>(Ljava/lang/String;Lcom/my/tracker/database/a;Lcom/my/tracker/b;Landroid/content/Context;)V

    .line 53
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    const-wide/16 v2, 0x3e8

    div-long/2addr v0, v2

    iput-wide v0, p0, Lcom/my/tracker/async/commands/k;->e:J

    .line 54
    return-void
.end method

.method private static a(Landroid/content/Context;)Ljava/lang/String;
    .locals 3

    .prologue
    .line 142
    const-string/jumbo v0, ""

    .line 143
    if-eqz p0, :cond_0

    .line 147
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v1

    .line 148
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    .line 149
    invoke-virtual {v1, v2}, Landroid/content/pm/PackageManager;->getInstallerPackageName(Ljava/lang/String;)Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v0

    .line 155
    :cond_0
    :goto_0
    return-object v0

    .line 152
    :catch_0
    move-exception v1

    const-string/jumbo v1, "cannot retrieve \"installer\", packageManager exception"

    invoke-static {v1}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private f()J
    .locals 6

    .prologue
    const-wide/16 v0, 0x0

    .line 163
    :try_start_0
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x8

    if-le v2, v3, :cond_0

    .line 165
    iget-object v2, p0, Lcom/my/tracker/async/commands/k;->a:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v2

    iget-object v3, p0, Lcom/my/tracker/async/commands/k;->a:Landroid/content/Context;

    invoke-virtual {v3}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v2

    .line 166
    iget-wide v2, v2, Landroid/content/pm/PackageInfo;->firstInstallTime:J

    const-wide/16 v4, 0x3e8

    div-long v0, v2, v4
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 175
    :cond_0
    :goto_0
    return-wide v0

    .line 172
    :catch_0
    move-exception v2

    .line 174
    new-instance v3, Ljava/lang/StringBuilder;

    const-string/jumbo v4, "Exception while trying to get app install time: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lcom/my/tracker/a;->c(Ljava/lang/String;)V

    goto :goto_0
.end method

.method private g()Landroid/util/Pair;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Pair",
            "<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .prologue
    .line 184
    :try_start_0
    iget-object v0, p0, Lcom/my/tracker/async/commands/k;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    iget-object v1, p0, Lcom/my/tracker/async/commands/k;->a:Landroid/content/Context;

    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/content/pm/PackageManager;->getPackageInfo(Ljava/lang/String;I)Landroid/content/pm/PackageInfo;

    move-result-object v1

    .line 185
    new-instance v0, Landroid/util/Pair;

    iget v2, v1, Landroid/content/pm/PackageInfo;->versionCode:I

    invoke-static {v2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    move-result-object v2

    iget-object v1, v1, Landroid/content/pm/PackageInfo;->versionName:Ljava/lang/String;

    invoke-direct {v0, v2, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V
    :try_end_0
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    .line 191
    :goto_0
    return-object v0

    .line 186
    :catch_0
    move-exception v0

    .line 188
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "Unable to read app version from package manager: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/tracker/a;->c(Ljava/lang/String;)V

    .line 191
    const/4 v0, 0x0

    goto :goto_0
.end method


# virtual methods
.method protected final c()Lcom/my/tracker/async/commands/e;
    .locals 12

    .prologue
    const/4 v5, 0x0

    .line 62
    new-instance v7, Lcom/my/tracker/async/commands/e;

    invoke-direct {v7}, Lcom/my/tracker/async/commands/e;-><init>()V

    .line 67
    :try_start_0
    invoke-static {}, Lcom/my/tracker/utils/e;->a()Lcom/my/tracker/utils/e;

    move-result-object v0

    iget-object v1, p0, Lcom/my/tracker/async/commands/k;->a:Landroid/content/Context;

    invoke-virtual {v0, v1}, Lcom/my/tracker/utils/e;->a(Landroid/content/Context;)Lcom/my/tracker/utils/e;
    :try_end_0
    .catch Ljava/lang/Throwable; {:try_start_0 .. :try_end_0} :catch_0

    move-result-object v8

    .line 1198
    iget-object v0, p0, Lcom/my/tracker/async/commands/k;->c:Lcom/my/tracker/b;

    invoke-virtual {v0}, Lcom/my/tracker/b;->s()Ljava/lang/String;

    move-result-object v1

    .line 1199
    if-eqz v1, :cond_d

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_d

    invoke-virtual {v8}, Lcom/my/tracker/utils/e;->j()Z

    move-result v0

    if-nez v0, :cond_d

    .line 1201
    const-string/jumbo v0, "check preinstall"

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 1203
    iget-object v0, p0, Lcom/my/tracker/async/commands/k;->a:Landroid/content/Context;

    invoke-virtual {v0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object v0

    .line 1204
    iget-object v2, p0, Lcom/my/tracker/async/commands/k;->a:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    .line 1209
    :try_start_1
    invoke-virtual {v0, v1}, Landroid/content/pm/PackageManager;->getResourcesForApplication(Ljava/lang/String;)Landroid/content/res/Resources;
    :try_end_1
    .catch Landroid/content/pm/PackageManager$NameNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    move-result-object v0

    .line 1215
    :goto_0
    const-string/jumbo v3, "mytracker"

    .line 1241
    if-nez v0, :cond_4

    move-object v0, v5

    .line 1216
    :goto_1
    invoke-virtual {v8}, Lcom/my/tracker/utils/e;->l()V

    .line 1218
    if-eqz v0, :cond_0

    .line 1219
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "preinstall referrer: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 1222
    :cond_0
    :goto_2
    if-nez v0, :cond_1

    invoke-virtual {v8}, Lcom/my/tracker/utils/e;->k()Z

    move-result v1

    if-nez v1, :cond_1

    .line 1223
    invoke-virtual {v8}, Lcom/my/tracker/utils/e;->h()Ljava/lang/String;

    move-result-object v0

    .line 1225
    :cond_1
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_2

    .line 1227
    invoke-virtual {v8, v0}, Lcom/my/tracker/utils/e;->g(Ljava/lang/String;)V

    .line 1229
    iget-object v1, p0, Lcom/my/tracker/async/commands/k;->a:Landroid/content/Context;

    .line 1230
    invoke-static {v1}, Lcom/my/tracker/async/commands/k;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v1

    iget-wide v2, p0, Lcom/my/tracker/async/commands/k;->e:J

    .line 1229
    invoke-static {v0, v1, v2, v3}, Lcom/my/tracker/factories/b;->a(Ljava/lang/String;Ljava/lang/String;J)Lcom/my/tracker/models/events/c;

    move-result-object v0

    .line 1232
    invoke-virtual {p0, v0}, Lcom/my/tracker/async/commands/k;->a(Lcom/my/tracker/models/events/c;)Z

    move-result v0

    .line 1233
    invoke-virtual {v8, v0}, Lcom/my/tracker/utils/e;->a(Z)V

    .line 1234
    if-eqz v0, :cond_6

    const-string/jumbo v0, "referrer inserted successfully"

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 79
    :cond_2
    :goto_3
    invoke-direct {p0}, Lcom/my/tracker/async/commands/k;->g()Landroid/util/Pair;

    move-result-object v1

    .line 80
    const-string/jumbo v0, ""

    .line 81
    const-string/jumbo v3, ""

    .line 82
    if-eqz v1, :cond_3

    .line 84
    iget-object v0, v1, Landroid/util/Pair;->first:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    .line 85
    iget-object v1, v1, Landroid/util/Pair;->second:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    move-object v3, v1

    .line 87
    :cond_3
    invoke-virtual {v8}, Lcom/my/tracker/utils/e;->b()Ljava/lang/String;

    move-result-object v1

    .line 88
    iget-object v2, p0, Lcom/my/tracker/async/commands/k;->c:Lcom/my/tracker/b;

    invoke-virtual {v2}, Lcom/my/tracker/b;->i()Ljava/lang/String;

    move-result-object v9

    .line 96
    invoke-virtual {v8, v9}, Lcom/my/tracker/utils/e;->a(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_7

    .line 98
    const-string/jumbo v1, "event install: no install flag"

    invoke-static {v1}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 99
    invoke-direct {p0}, Lcom/my/tracker/async/commands/k;->f()J

    move-result-wide v2

    iget-object v1, p0, Lcom/my/tracker/async/commands/k;->a:Landroid/content/Context;

    .line 100
    invoke-static {v1}, Lcom/my/tracker/async/commands/k;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    iget-wide v10, p0, Lcom/my/tracker/async/commands/k;->e:J

    .line 2070
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 2071
    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2072
    new-instance v1, Lcom/my/tracker/models/events/d;

    invoke-direct/range {v1 .. v6}, Lcom/my/tracker/models/events/d;-><init>(JLjava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    .line 102
    invoke-virtual {p0, v1}, Lcom/my/tracker/async/commands/k;->a(Lcom/my/tracker/models/events/c;)Z

    move-result v1

    .line 103
    if-eqz v1, :cond_c

    .line 105
    invoke-virtual {v8, v9}, Lcom/my/tracker/utils/e;->c(Ljava/lang/String;)V

    .line 106
    invoke-virtual {v8, v0}, Lcom/my/tracker/utils/e;->b(Ljava/lang/String;)V

    move v0, v1

    .line 129
    :goto_4
    if-eqz v0, :cond_b

    .line 131
    invoke-super {p0}, Lcom/my/tracker/async/commands/f;->c()Lcom/my/tracker/async/commands/e;

    move-result-object v1

    .line 132
    invoke-virtual {v1}, Lcom/my/tracker/async/commands/e;->a()Z

    move-result v0

    if-nez v0, :cond_a

    .line 137
    :goto_5
    return-object v1

    .line 68
    :catch_0
    move-exception v0

    .line 70
    new-instance v1, Ljava/lang/StringBuilder;

    const-string/jumbo v2, "PreferencesManager error: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 71
    const/4 v0, 0x0

    invoke-virtual {v7, v0}, Lcom/my/tracker/async/commands/e;->a(Z)V

    move-object v1, v7

    .line 72
    goto :goto_5

    .line 1212
    :catch_1
    move-exception v0

    new-instance v0, Ljava/lang/StringBuilder;

    const-string/jumbo v3, "unable to locate vendor app: "

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    move-object v0, v5

    goto/16 :goto_0

    .line 1244
    :cond_4
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string/jumbo v4, "_"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1245
    const-string/jumbo v3, "string"

    invoke-virtual {v0, v2, v3, v1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v1

    .line 1247
    if-nez v1, :cond_5

    move-object v0, v5

    .line 1248
    goto/16 :goto_1

    .line 1250
    :cond_5
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v0

    goto/16 :goto_1

    .line 1235
    :cond_6
    const-string/jumbo v0, "insert referrer failed"

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    goto/16 :goto_3

    .line 109
    :cond_7
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_9

    .line 111
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-nez v1, :cond_8

    const-string/jumbo v1, "event update: no old version"

    invoke-static {v1}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 113
    :goto_6
    iget-object v1, p0, Lcom/my/tracker/async/commands/k;->a:Landroid/content/Context;

    .line 115
    invoke-static {v1}, Lcom/my/tracker/async/commands/k;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    iget-wide v10, p0, Lcom/my/tracker/async/commands/k;->e:J

    .line 2088
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 2089
    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    invoke-virtual {v6, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2090
    new-instance v1, Lcom/my/tracker/models/events/j;

    move-object v2, v0

    invoke-direct/range {v1 .. v6}, Lcom/my/tracker/models/events/j;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    .line 117
    invoke-virtual {p0, v1}, Lcom/my/tracker/async/commands/k;->a(Lcom/my/tracker/models/events/c;)Z

    move-result v1

    .line 118
    if-eqz v1, :cond_c

    .line 120
    invoke-virtual {v8, v0}, Lcom/my/tracker/utils/e;->b(Ljava/lang/String;)V

    move v0, v1

    goto/16 :goto_4

    .line 112
    :cond_8
    const-string/jumbo v1, "event update: version changed"

    invoke-static {v1}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    goto :goto_6

    .line 125
    :cond_9
    const-string/jumbo v0, "no install/update"

    invoke-static {v0}, Lcom/my/tracker/a;->a(Ljava/lang/String;)V

    .line 126
    const/4 v0, 0x1

    goto/16 :goto_4

    .line 133
    :cond_a
    sget-object v0, Lcom/my/tracker/enums/a;->a:Lcom/my/tracker/enums/a;

    invoke-virtual {p0, v0}, Lcom/my/tracker/async/commands/k;->a(Lcom/my/tracker/enums/a;)Z

    move-result v0

    .line 136
    :goto_7
    invoke-virtual {v1, v0}, Lcom/my/tracker/async/commands/e;->a(Z)V

    goto/16 :goto_5

    :cond_b
    move-object v1, v7

    goto :goto_7

    :cond_c
    move v0, v1

    goto/16 :goto_4

    :cond_d
    move-object v0, v5

    goto/16 :goto_2
.end method
