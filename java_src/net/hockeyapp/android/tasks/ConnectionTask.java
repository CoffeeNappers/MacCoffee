package net.hockeyapp.android.tasks;

import android.os.AsyncTask;
import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
/* loaded from: classes3.dex */
public abstract class ConnectionTask<Params, Progress, Result> extends AsyncTask<Params, Progress, Result> {
    /* JADX INFO: Access modifiers changed from: protected */
    public static String getStringFromConnection(HttpURLConnection connection) throws IOException {
        InputStream inputStream = new BufferedInputStream(connection.getInputStream());
        String jsonString = convertStreamToString(inputStream);
        inputStream.close();
        return jsonString;
    }

    private static String convertStreamToString(InputStream inputStream) {
        BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream), 1024);
        StringBuilder stringBuilder = new StringBuilder();
        while (true) {
            try {
                try {
                    String line = reader.readLine();
                    if (line != null) {
                        stringBuilder.append(line + "\n");
                    } else {
                        try {
                            break;
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                } finally {
                    try {
                        inputStream.close();
                    } catch (IOException e2) {
                        e2.printStackTrace();
                    }
                }
            } catch (IOException e3) {
                e3.printStackTrace();
            }
        }
        inputStream.close();
        return stringBuilder.toString();
    }
}
